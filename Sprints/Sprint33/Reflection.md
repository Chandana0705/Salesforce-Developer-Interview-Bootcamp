
# Reflection – Sprint 33

Sprint 33 helped me understand that building an integration is not only about making an API call successfully.

In Sprint 32, I focused on connecting Salesforce with the external recruitment API. In Sprint 33, I learned how to make that integration more reliable.

I added fields to the Application object to track the integration state. These included the last integration attempt and the number of integration attempts.

I also improved the Queueable Apex class to handle different HTTP responses separately. Instead of treating every failure in the same way, the implementation distinguishes between bad requests, authentication failures, forbidden responses, server errors, and unexpected responses.

One of the most important concepts I learned was idempotency. If the same Application is processed again after a successful synchronization, the system should not create another external candidate.

I implemented this by checking `External_Candidate_ID__c` before making the API call.

During testing, the first successful API request returned:

```text
Attempt: 1
Status Code: 201
