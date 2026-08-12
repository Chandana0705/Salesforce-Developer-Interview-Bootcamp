trigger ApplicationTrigger on Application__c (after insert, after update) {

    List<Id> applicationIds = new List<Id>();

    for (Application__c app : Trigger.new) {

        Boolean isSelected =
            app.Status__c == 'Selected';

        Boolean wasSelected = false;

        if (Trigger.isUpdate) {
            Application__c oldApp =
                Trigger.oldMap.get(app.Id);

            wasSelected =
                oldApp.Status__c == 'Selected';
        }

        if (isSelected && !wasSelected) {
            applicationIds.add(app.Id);
        }
    }

    for (Id applicationId : applicationIds) {

        System.enqueueJob(
            new CandidateSyncQueueable(applicationId)
        );
    }
}