# Learning Notes – Sprint 33

## Overview

Sprint 33 focused on improving the reliability of the external recruitment integration by tracking integration attempts, handling API failures, implementing controlled retries, and preventing duplicate candidate submissions.

## Concepts Learned

- Learned how to track the last time an external API integration was attempted.
- Learned how to track the number of integration attempts using `Integration_Retry_Count__c`.
- Learned how to handle different HTTP status codes returned by an external API.
- Understood how to implement controlled retry processing for temporary server-side failures.
- Learned how to limit the number of retry attempts to prevent unlimited processing.
- Learned the concept of idempotency in external integrations.
- Learned how to prevent duplicate candidate submissions using `External_Candidate_ID__c`.
- Learned how to store integration errors in Salesforce for troubleshooting.
- Learned how Queueable Apex can be used for reliable asynchronous API integrations.
- Learned how to verify integration results using Debug Logs and Salesforce records.

## Key Takeaways

- External integrations should be designed to handle failures.
- Integration status should be tracked separately from the main business status.
- Retry processing should have a defined limit.
- Different HTTP status codes should be handled appropriately.
- Duplicate submissions should be prevented using an idempotency strategy.
- `External_Candidate_ID__c` can be used to identify an already synchronized candidate.
- `Last_Integration_Attempt__c` helps administrators identify when synchronization was last attempted.
- `Integration_Retry_Count__c` helps track the number of integration attempts.
- Error information should be stored on the Salesforce record for easier troubleshooting.
- A successful Salesforce transaction does not necessarily mean that the external synchronization was successful.
