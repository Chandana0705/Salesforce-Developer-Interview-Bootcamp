// Queue Job A
for (Application__c app : newApplications) {

    Application__c oldApp = oldApplications.get(app.Id);

    if (app.Status__c == 'Selected' &&
        oldApp.Status__c != 'Selected') {

        System.enqueueJob(
            new ExternalPlacementSyncJob(app.Id)
        );
    }
}
