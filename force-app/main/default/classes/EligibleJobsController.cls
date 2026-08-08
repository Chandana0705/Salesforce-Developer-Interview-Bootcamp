public with sharing class EligibleJobsController {

    @AuraEnabled(cacheable=true)
    public static List<Company__c> getEligibleJobs() {

        // Get a student
        Student__c student = [
            SELECT Id,
                   StudentCGPA__c,
                   Branch__c,
                   Backlogs__c,
                   GraduationYear__c
            FROM Student__c
            LIMIT 1
        ];

        // Get all companies
        List<Company__c> companies = [
            SELECT Id,
                   Name,
                   JobRole__c,
                   Package__c,
                   CompanyLocation__c,
                   LastDateToApply__c,
                   MinimumCGPA__c,
                   Branch__c,
                   Allowed_Backlogs__c,
                   Graduation_Year_Requirement__c
            FROM Company__c
        ];

        // Store only eligible companies
        List<Company__c> eligibleJobs = new List<Company__c>();

        for (Company__c company : companies) {

            if (JobEligibilityService.isEligible(student, company)) {
                eligibleJobs.add(company);
            }
        }

        return eligibleJobs;
    }
}