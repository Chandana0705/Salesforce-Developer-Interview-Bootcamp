public class ExternalPlacementSyncJob implements Queueable {

    private Id applicationId;

    public ExternalPlacementSyncJob(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        // Retrieve latest Application data
        Application__c app = [
            SELECT Id,
                   Student__c,
                   Company__c,
                   Status__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        // Simulate External System Synchronization
        System.debug('Synchronizing placement information...');
        System.debug('Application Id : ' + app.Id);
        System.debug('Student : ' + app.Student__c);
        System.debug('Company : ' + app.Company__c);

        // If synchronization succeeds, start Job B
        System.enqueueJob(new PlacementNotificationJob(applicationId));
    }
}
