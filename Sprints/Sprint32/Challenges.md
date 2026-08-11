# Challenges – Sprint 32

## Challenges Faced

### Challenge 1

Understanding how the Salesforce application should communicate with an external recruitment system.

### Solution

Defined an API contract first and understood the complete flow from Application Status to Queueable Apex, Named Credential, REST API, and response processing.

---

### Challenge 2

Configuring the Named Credential and External Credential correctly.

### Solution

Created the External Credential and principal, configured the Named Credential, and assigned the required permission set to the Salesforce user.

---

### Challenge 3

The first mock API returned HTTP 405 Method Not Allowed when the POST request was sent.

### Solution

Identified that the selected mock endpoint did not support the required POST request and replaced it with a mock endpoint that supported the required recruitment API testing.

---

### Challenge 4

The Queueable deployment initially failed because the API names of the newly created Application fields were different from the names used in Apex.

### Solution

Checked the actual Salesforce field API names and updated the Queueable to use:

```text
External_Candidate_ID__c
Sync_Status__c
Sync_Error__c
