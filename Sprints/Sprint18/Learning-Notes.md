# Learning Notes – Sprint 18

## Concepts Learned

### Trigger.oldMap

Stores the previous version of records before they were updated.

### Trigger.new

Contains the updated version of records.

### Why compare old and new values?

To determine whether the Application Status actually changed.

Example:

Applied → Selected

Business logic executes.

Selected → Selected

Business logic does not execute.

---

## Bulk Processing

Salesforce Triggers can receive multiple records in one transaction.

Always design code to process Lists instead of single records.

---

## Set Collection

Used to collect unique Student IDs.

Benefits:

- Removes duplicate IDs.
- Improves query performance.

---

## Map Collection

Stores Student records for quick lookup using their Id.

---

## SOQL Best Practice

Execute one SOQL query outside loops.

Avoid SOQL inside loops to prevent Governor Limit exceptions.

---

## DML Best Practice

Update all Student records together using one update statement.

Never perform DML inside loops.

---

## Engineering Principle

Triggers should detect business events.

Service classes should contain business logic.

This architecture improves scalability and maintainability.
