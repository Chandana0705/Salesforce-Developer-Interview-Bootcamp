public with sharing class CandidateSyncQueueable
    implements Queueable, Database.AllowsCallouts {

    private Id applicationId;

    public CandidateSyncQueueable(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        Application__c app = [
            SELECT Id,
                   Student__c,
                   Student__r.Name,
                   Company__c,
                   Company__r.Name,
                   CGPA__c,
                   jobID__c,
                   ApplicationDate__c,
                   Status__c,
                   Last_Integration_Attempt__c,
                   Sync_Status__c,
                   External_Candidate_ID__c,
                   Sync_Error__c,
                   Integration_Retry_Count__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];
// Prevent duplicate submission
if (app.External_Candidate_ID__c != null) {

    System.debug(
        'Candidate already synchronized. ' +
        'Skipping duplicate submission.'
    );

    return;
}
        Integer currentAttempt =
            app.Integration_Retry_Count__c == null
            ? 0
            : Integer.valueOf(
                String.valueOf(
                    app.Integration_Retry_Count__c
                )
            );

        Integer attemptNumber = currentAttempt + 1;

        Datetime attemptTime = System.now();

        HttpRequest request = new HttpRequest();

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

            Http http = new Http();

            HttpResponse response =
                http.send(request);

            Integer statusCode =
                response.getStatusCode();

            String responseBody =
                response.getBody();

            System.debug(
                'Attempt: ' + attemptNumber
            );

            System.debug(
                'Status Code: ' + statusCode
            );

            System.debug(
                'Response Body: ' +
                responseBody
            );

            Application__c updateApp =
                new Application__c(
                    Id = applicationId,

                    Last_Integration_Attempt__c =
                        attemptTime,

                    Integration_Retry_Count__c =
                        attemptNumber
                );

            // SUCCESS
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

                updateApp.Sync_Error__c =
                    null;

                update updateApp;

            }

            // SERVER ERROR → RETRY
            else if (statusCode >= 500) {

                if (attemptNumber < 3) {

                    updateApp.Sync_Status__c =
                        'Pending';

                    updateApp.Sync_Error__c =
                        'External server error (' +
                        statusCode +
                        '). Retry scheduled.';

                    update updateApp;

                    System.enqueueJob(
                        new CandidateSyncQueueable(
                            applicationId
                        )
                    );

                } else {

                    updateApp.Sync_Status__c =
                        'Failed';

                    updateApp.Sync_Error__c =
                        'External server error (' +
                        statusCode +
                        '). Maximum retries reached.';

                    update updateApp;
                }

            }

            // BAD REQUEST
            else if (statusCode == 400) {

                updateApp.Sync_Status__c =
                    'Failed';

                updateApp.Sync_Error__c =
                    'Bad Request (400): ' +
                    responseBody;

                update updateApp;
            }

            // AUTHENTICATION FAILURE
            else if (statusCode == 401) {

                updateApp.Sync_Status__c =
                    'Failed';

                updateApp.Sync_Error__c =
                    'Authentication Failed (401)';

                update updateApp;
            }

            // FORBIDDEN
            else if (statusCode == 403) {

                updateApp.Sync_Status__c =
                    'Failed';

                updateApp.Sync_Error__c =
                    'Forbidden (403)';

                update updateApp;
            }

            // UNEXPECTED RESPONSE
            else {

                updateApp.Sync_Status__c =
                    'Failed';

                updateApp.Sync_Error__c =
                    'Unexpected HTTP Status (' +
                    statusCode + ')';

                update updateApp;
            }

        } catch (Exception e) {

            Application__c updateApp =
                new Application__c(
                    Id = applicationId,

                    Last_Integration_Attempt__c =
                        attemptTime,

                    Integration_Retry_Count__c =
                        attemptNumber,

                    Sync_Status__c =
                        'Failed',

                    Sync_Error__c =
                        e.getMessage()
                );

            update updateApp;

            System.debug(
                'Callout Error: ' +
                e.getMessage()
            );
        }
    }
}