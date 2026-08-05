# Challenges – Sprint 17

## Challenge 1

Converting single-record processing into bulk processing.

### Solution

Modified the service method to accept a List<Application__c> instead of processing one application at a time.

---

## Challenge 2

Avoiding SOQL queries inside loops.

### Solution

Collected Student IDs and Company IDs into Sets and executed one query for each object.

---

## Challenge 3

Efficiently validating each application.

### Solution

Stored queried records in Maps and retrieved them during validation without additional database queries.

---

## Challenge 4

Understanding Governor Limits.

### Solution

Learned that bulkified code prevents exceeding Salesforce limits when processing many records.
