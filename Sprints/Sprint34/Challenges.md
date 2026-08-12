

# Challenges – Sprint 34

## Challenge 1

Understanding which integration pattern should be used when an immediate response is required.

### Solution

Designed the Immediate Verification integration using LWC → Apex → External API → Response → LWC and identified it as a synchronous integration.

---

## Challenge 2

Understanding how candidate synchronization should be performed without making the user wait for the external system.

### Solution

Used the asynchronous architecture of Trigger → Queueable → Named Credential → External API.

The existing `CandidateSyncQueueable` implementation was reused for this architecture.

---

## Challenge 3

Designing a solution for processing a large number of historical records.

### Solution

Created `HistoricalSyncScheduler` and `HistoricalSyncBatch` using Scheduled Apex and Batch Apex.

The scheduler starts the Batch Apex process for historical synchronization.

---

## Challenge 4

Handling external API failures during historical synchronization.

### Solution

Implemented HTTP response handling for successful responses, client errors, authentication failures, forbidden responses, server errors, and unexpected responses.

---

## Challenge 5

Understanding how retry processing should be controlled.

### Solution

Used `Integration_Retry_Count__c` to track integration attempts and limited retry processing to a maximum of three attempts.

---

## Challenge 6

Preventing duplicate candidate creation during retries or repeated Queueable execution.

### Solution

Used `External_Candidate_ID__c` to identify candidates that were already synchronized and skipped duplicate submissions.

---

## Challenge 7

Understanding why credentials should not be written directly inside Apex.

### Solution

Used Salesforce Named Credentials and External Credentials instead of hard-coding authentication information in Apex.

---

## Challenge 8

Understanding the architectural problem created by many direct point-to-point integrations.

### Solution

Reviewed middleware architecture as a scalable approach for routing, transformation, orchestration, monitoring, and retry management when multiple external systems are involved.
