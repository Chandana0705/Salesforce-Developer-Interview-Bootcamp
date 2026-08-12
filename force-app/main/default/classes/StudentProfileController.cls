public with sharing class StudentProfileController {

    @AuraEnabled(cacheable=true)
    public static Id getCurrentStudentId() {

        Id currentUserId = UserInfo.getUserId();

        Student__c student = [
            SELECT Id
            FROM Student__c
            WHERE Student_User__c = :currentUserId
            LIMIT 1
        ];

        return student.Id;
    }
}