public with sharing class ApplicationController {

    @AuraEnabled
    public static Id submitApplication(Id jobId) {

        return ApplicationService.submitApplication(jobId);

    }
}