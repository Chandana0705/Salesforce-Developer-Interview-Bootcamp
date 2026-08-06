# Engineering Sprint 21 – Learning Notes

## Sprint Objective

Learn how Batch Apex processes large datasets efficiently.

---

## What I Learned

### Batch Apex

Batch Apex is used when processing thousands of Salesforce records.

Instead of processing every record together, Salesforce divides them into multiple transactions.

---

### Three Methods

### start()

Responsible for selecting records.

Returns:

- Database.QueryLocator

---

### execute()

Processes one batch of records.

Receives:

- Batch Context
- List<Application__c>

Business logic is written here.

---

### finish()

Runs only once after all batches complete.

Used for:

- Notifications
- Logging
- Starting another process

---

## Why Batch Apex?

Benefits:

- Handles large datasets
- Fresh governor limits for each batch
- Better scalability
- Reliable processing

---

## Bulkification

Even inside Batch Apex:

- No SOQL inside loops
- No DML inside loops

Update records after processing the entire scope.

---

## Interview Questions

Q: When should you use Batch Apex?

A:

When processing very large datasets that cannot be handled in a single transaction.

---

Q: What are the three Batch methods?

A:

- start()
- execute()
- finish()

---

## Summary

Batch Apex makes Salesforce capable of processing thousands of records safely while respecting Governor Limits.
