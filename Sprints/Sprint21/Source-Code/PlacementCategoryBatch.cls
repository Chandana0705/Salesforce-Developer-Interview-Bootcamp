public class PlacementCategoryBatch implements Database.Batchable<SObject> {

    // STEP 1 : Select records to process
    public Database.QueryLocator start(Database.BatchableContext bc) {

        return Database.getQueryLocator([
            SELECT Id,
                   Placement_Category__c,
                   Package__c,
                   Placement_Status__c
            FROM Application__c
            WHERE Placement_Category__c = NULL
        ]);
    }

    // STEP 2 : Process each batch
    public void execute(Database.BatchableContext bc,
                        List<Application__c> scope) {

        for(Application__c app : scope){

            // Sample Business Logic

            if(app.Package__c >= 1200000){
                app.Placement_Category__c = 'Dream';
            }
            else if(app.Package__c >= 600000){
                app.Placement_Category__c = 'Super Dream';
            }
            else{
                app.Placement_Category__c = 'Regular';
            }

        }

        update scope;

    }

    // STEP 3 : Runs after all batches finish
    public void finish(Database.BatchableContext bc){

        System.debug('Placement Category Batch Completed Successfully');

    }

}
