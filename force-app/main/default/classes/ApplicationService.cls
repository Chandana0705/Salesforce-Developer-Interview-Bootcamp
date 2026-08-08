public with sharing class ApplicationService {

    public static Id submitApplication(Id jobId) {

        // Get the selected company/job
        Company__c company = [
            SELECT Id,
                   Name,
                   MinimumCGPA__c,
                   Branch__c,
                   Allowed_Backlogs__c,
                   Graduation_Year_Requirement__c,
                   LastDateToApply__c
            FROM Company__c
            WHERE Id = :jobId
            LIMIT 1
        ];

        // Get the student
        Student__c student = [
            SELECT Id,
                   Name,
                   Email__c,
                   StudentCGPA__c,
                   Branch__c,
                   Backlogs__c,
                   GraduationYear__c
            FROM Student__c
            LIMIT 1
        ];

        // Check duplicate application
        List<Application__c> existingApplications = [
            SELECT Id
            FROM Application__c
            WHERE Student__c = :student.Id
            AND Company__c = :company.Id
            LIMIT 1
        ];

        if (!existingApplications.isEmpty()) {
            throw new AuraHandledException(
                'You have already applied for this company.'
            );
        }

        // Check eligibility using existing service
        if (!JobEligibilityService.isEligible(student, company)) {
            throw new AuraHandledException(
                'You are not eligible for this job.'
            );
        }

        // Create Application
        Application__c application = new Application__c();

        application.Name =
            student.Name + ' - ' + company.Name;

        application.Student__c = student.Id;
        application.Company__c = company.Id;
        application.Status__c = 'Applied';
        application.ApplicationDate__c =
            String.valueOf(Date.today());

        insert application;

        return application.Id;
    }
}