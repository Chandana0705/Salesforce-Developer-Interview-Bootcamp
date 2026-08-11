
# Reflection – Sprint 32

Sprint 32 was an important step in my Salesforce development journey because the application moved beyond Salesforce and started communicating with an external system.

I learned that an integration is not simply about sending an HTTP request. It requires a clear API contract, proper authentication configuration, asynchronous processing, response handling, and failure management.

I created the API contract for the recruitment integration and implemented `CandidateSyncQueueable` to perform the external callout. I also configured a Named Credential and External Credential instead of placing credentials directly in Apex.

During testing, I faced a few configuration and deployment issues. I learned how to troubleshoot Named Credential permissions, External Credential principals, Debug Logs, and Apex deployment errors. I also learned the importance of checking the actual Salesforce API names of custom fields before using them in Apex.

The final integration test successfully used a real `Application__c` record and returned an HTTP 201 response from the mock recruitment API. The Queueable job also completed successfully.

Overall, Sprint 32 helped me understand that Salesforce integration requires designing for communication, security, failures, and data consistency between independent systems.
