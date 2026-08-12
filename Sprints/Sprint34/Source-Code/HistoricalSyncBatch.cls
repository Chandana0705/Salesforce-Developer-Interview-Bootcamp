global with sharing class HistoricalSyncBatch
    implements Database.Batchable<SObject>, Database.AllowsCallouts {

    global Database.QueryLocator start(
        Database.BatchableContext bc
    ) {
        return Database.getQueryLocator(
            'SELECT Id, ' +
            'Student__c, ' +
            'Student__r.Name, ' +
            'Company__c, ' +
            'Company__r.Name, ' +
            'CGPA__c, ' +
            'jobID__c, ' +
            'ApplicationDate__c, ' +
            'Status__c, ' +
            'Last_Integration_Attempt__c, ' +
            'Sync_Status__c, ' +
            'External_Candidate_ID__c, ' +
            'Sync_Error__c, ' +
            'Integration_Retry_Count__c ' +
            'FROM Application__c ' +
            'WHERE Status__c = \'Selected\' ' +
            'AND External_Candidate_ID__c = null ' +
            'AND (Integration_Retry_Count__c = null ' +
            'OR Integration_Retry_Count__c < 3)'
        );
    }

    global void execute(
        Database.BatchableContext bc,
        List<SObject> scope
    ) {

        System.debug(
            'Processing historical synchronization batch. ' +
            'Records in current batch: ' +
            scope.size()
        );

        for (SObject record : scope) {

            Application__c app =
                (Application__c) record;

            Datetime attemptTime =
                System.now();

            Integer currentAttempt =
                app.Integration_Retry_Count__c == null
                ? 0
                : Integer.valueOf(
                    String.valueOf(
                        app.Integration_Retry_Count__c
                    )
                );

            Integer attemptNumber =
                currentAttempt + 1;

            HttpRequest request =
                new HttpRequest();

            request.setEndpoint(
                'callout:Recruitment_API'
            );

            request.setMethod('POST');

            request.setHeader(
                'Content-Type',
                'application/json'
            );

            Map<String, Object> payload =
                new Map<String, Object>();

            payload.put(
                'studentId',
                app.Student__c
            );

            payload.put(
                'name',
                app.Student__r.Name
            );

            payload.put(
                'cgpa',
                app.CGPA__c
            );

            payload.put(
                'jobId',
                app.jobID__c
            );

            payload.put(
                'company',
                app.Company__r.Name
            );

            payload.put(
                'selectionDate',
                app.ApplicationDate__c
            );

            request.setBody(
                JSON.serialize(payload)
            );

            try {

                HttpResponse response =
                    new Http().send(request);

                Integer statusCode =
                    response.getStatusCode();

                String responseBody =
                    response.getBody();

                System.debug(
                    'Historical Sync Attempt: ' +
                    attemptNumber
                );

                System.debug(
                    'Status Code: ' +
                    statusCode
                );

                System.debug(
                    'Response Body: ' +
                    responseBody
                );

                Application__c updateApp =
                    new Application__c(
                        Id = app.Id,
                        Last_Integration_Attempt__c =
                            attemptTime,
                        Integration_Retry_Count__c =
                            attemptNumber
                    );

                if (
                    statusCode == 200 ||
                    statusCode == 201
                ) {

                    Map<String, Object> result =
                        (Map<String, Object>)
                        JSON.deserializeUntyped(
                            responseBody
                        );

                    updateApp.Sync_Status__c =
                        'Success';

                    updateApp.External_Candidate_ID__c =
                        (String)
                        result.get(
                            'externalCandidateId'
                        );

                    updateApp.Sync_Error__c = null;

                } else if (statusCode >= 500) {

                    updateApp.Sync_Status__c =
                        attemptNumber < 3
                        ? 'Pending'
                        : 'Failed';

                    updateApp.Sync_Error__c =
                        'External server error (' +
                        statusCode +
                        ').';

                } else if (statusCode == 400) {

                    updateApp.Sync_Status__c =
                        'Failed';

                    updateApp.Sync_Error__c =
                        'Bad Request (400): ' +
                        responseBody;

                } else if (statusCode == 401) {

                    updateApp.Sync_Status__c =
                        'Failed';

                    updateApp.Sync_Error__c =
                        'Authentication Failed (401)';

                } else if (statusCode == 403) {

                    updateApp.Sync_Status__c =
                        'Failed';

                    updateApp.Sync_Error__c =
                        'Forbidden (403)';

                } else {

                    updateApp.Sync_Status__c =
                        'Failed';

                    updateApp.Sync_Error__c =
                        'Unexpected HTTP Status (' +
                        statusCode + ')';
                }

                update updateApp;

            } catch (Exception e) {

                update new Application__c(
                    Id = app.Id,
                    Last_Integration_Attempt__c =
                        attemptTime,
                    Integration_Retry_Count__c =
                        attemptNumber,
                    Sync_Status__c =
                        attemptNumber < 3
                        ? 'Pending'
                        : 'Failed',
                    Sync_Error__c =
                        e.getMessage()
                );
            }
        }
    }

    global void finish(
        Database.BatchableContext bc
    ) {
        System.debug(
            'Historical synchronization batch completed.'
        );
    }
}