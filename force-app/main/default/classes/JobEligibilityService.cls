public with sharing class JobEligibilityService {

    public static Boolean isEligible(
        Student__c student,
        Company__c company
    ) {

        // 1. Check CGPA
        if (
            student.StudentCGPA__c < company.MinimumCGPA__c
        ) {
            return false;
        }

        // 2. Check Branch
        if (
            student.Branch__c != company.Branch__c
        ) {
            return false;
        }

        // 3. Check Backlogs
        if (
            student.Backlogs__c > company.Allowed_Backlogs__c
        ) {
            return false;
        }

        // 4. Check Graduation Year
        if (
            student.GraduationYear__c < company.Graduation_Year_Requirement__c
        ) {
            return false;
        }

        // 5. Check application deadline
        if (
            company.LastDateToApply__c < Date.today()
        ) {
            return false;
        }

        return true;
    }
}