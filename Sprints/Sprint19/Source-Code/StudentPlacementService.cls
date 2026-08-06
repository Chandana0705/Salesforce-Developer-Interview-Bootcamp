public class StudentPlacementService {

    public static void processSelectedApplications(
        List<Application__c> newApplications,
        Map<Id, Application__c> oldApplications
    ){

        Set<Id> studentIds = new Set<Id>();
        Map<Id, Id> studentCompanyMap = new Map<Id, Id>();

        for(Application__c app : newApplications){

            Application__c oldApp = oldApplications.get(app.Id);

            if(app.Status__c == 'Selected'
               && oldApp.Status__c != 'Selected'){

                studentIds.add(app.Student__c);
                studentCompanyMap.put(app.Student__c, app.Company__c);
            }
        }

        if(studentIds.isEmpty()){
            return;
        }

        List<Student__c> students = [
            SELECT Id,
                   Placement_Status__c,
                   Selected_Company__c
            FROM Student__c
            WHERE Id IN :studentIds
        ];

        for(Student__c stu : students){

            stu.Placement_Status__c = 'Placed';
            stu.Selected_Company__c = studentCompanyMap.get(stu.Id);

        }

        update students;

        // Queue background processing
        for(Application__c app : newApplications){

            Application__c oldApp = oldApplications.get(app.Id);

            if(app.Status__c == 'Selected'
               && oldApp.Status__c != 'Selected'){

                System.enqueueJob(
                    new PlacementPostProcessingJob(app.Id)
                );

            }

        }

    }

}
