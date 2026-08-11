# Challenges – Sprint 33

## Challenge 1

Understanding how to track the last integration attempt.

### Solution

Created the `Last_Integration_Attempt__c` field and updated the Queueable to store the current date and time whenever an integration attempt is made.

---

## Challenge 2

Handling different HTTP response codes from the external API.

### Solution

Implemented separate handling for successful responses, bad requests, authentication failures, forbidden responses, server errors, and unexpected responses.

---

## Challenge 3

Handling temporary server failures from the external API.

### Solution

Implemented a controlled retry mechanism for server-side errors (`500+`) with a maximum of three integration attempts.

---

## Challenge 4

Tracking the number of integration attempts for an Application.

### Solution

Created the `Integration_Retry_Count__c` field and updated the Queueable to store the number of integration attempts.

---

## Challenge 5

Preventing duplicate candidate submissions when the same Application is processed again.

### Solution

Used `External_Candidate_ID__c` to check whether the candidate has already been synchronized. If the external candidate ID already exists, the Queueable skips the API submission.

---

## Challenge 6

Testing whether duplicate prevention was working correctly.

### Solution

Executed the Queueable again using an already synchronized Application and verified the Debug Log message:

```text
Candidate already synchronized. Skipping duplicate submission.
