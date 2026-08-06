# Engineering Sprint 20 – Queueable Chaining

## Objective

Design a Queueable Chain where one Queueable job starts another after successful completion.

---

## Business Requirement

When a student's application is selected:

- Update Student information immediately.
- Synchronize placement information with an external system.
- After successful synchronization, prepare notification processing.

---

## Architecture

Application Selected
↓
Trigger
↓
StudentPlacementService
↓
Update Student
↓
System.enqueueJob()
↓
ExternalPlacementSyncJob
↓
External Synchronization
↓
System.enqueueJob()
↓
PlacementNotificationJob
↓
Prepare Notifications

---

## Components

### StudentPlacementService

- Updates Student records.
- Starts Queueable Job A.

### ExternalPlacementSyncJob

Responsibilities:

- Retrieve latest Application data.
- Simulate external synchronization.
- Queue Job B after successful completion.

### PlacementNotificationJob

Responsibilities:

- Prepare notifications.
- Keep notification logic separate from integration logic.

---

## Why Queueable Chaining?

Queueable chaining provides:

- Sequential execution
- Better separation of responsibilities
- Easier debugging
- Better scalability
- Cleaner architecture

---

## Engineering Principles

- One responsibility per Queueable.
- Execute Job B only after Job A succeeds.
- Pass only meaningful data (Application Id).
- Retrieve current data during execution.
- Design for future scalability.

---

## Files

- StudentPlacementService.cls
- ExternalPlacementSyncJob.cls
- PlacementNotificationJob.cls

---

## Learning Outcomes

- Implemented Queueable Chaining.
- Learned sequential asynchronous execution.
- Designed modular Queueable jobs.
- Improved system maintainability.
