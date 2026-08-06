public class PlacementNotificationJob implements Queueable {

    private Id applicationId;

    public PlacementNotificationJob(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        Application__c app = [
            SELECT Id,
                   Student__r.Name,
                   Company__r.Name
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        // Simulate Notification Processing
        System.debug('Preparing notification...');
        System.debug('Student : ' + app.Student__r.Name);
        System.debug('Company : ' + app.Company__r.Name);

        // Future enhancement:
        // Email Student
        // Send SMS
        // Create Notification__c record
    }
}
