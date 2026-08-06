# Engineering Sprint 19 – Queueable Apex

## Objective

Move secondary processing to the background using Queueable Apex while keeping the student's transaction fast and responsive.

---

## Business Requirement

After an application is successfully selected:

- Update the Student immediately.
- Queue a background job.
- Do not make the user wait for secondary processing.

---

## Components

### StudentPlacementService

Responsible for:

- Detecting newly selected applications.
- Updating Student records.
- Enqueuing the Queueable job.

---

### PlacementPostProcessingJob

Implements Queueable Apex.

Responsible for:

- External placement synchronization.
- Notification preparation.
- Analytics processing.

Only the Application Id is passed to the Queueable class. The remaining data is queried during execution.

---

## Flow

Student Selected
↓
Trigger
↓
StudentPlacementService
↓
Update Student
↓
System.enqueueJob()
↓
PlacementPostProcessingJob
↓
External Sync
↓
Notification Preparation
↓
Analytics

---

## Why Queueable Apex?

Queueable Apex is suitable because:

- It executes asynchronously.
- The user does not wait for background processing.
- Complex business logic can be handled separately.
- The Queueable job can later be chained if additional processing is required.

---

## Engineering Principles

- Keep essential work synchronous.
- Move secondary work to the background.
- Pass only the Application Id to Queueable Apex.
- Query the latest data when the Queueable job executes.
- Give the Queueable class a single responsibility.

---

## Files

- StudentPlacementService.cls
- PlacementPostProcessingJob.cls

---

## Learning Outcomes

- Implemented Queueable Apex.
- Used System.enqueueJob().
- Separated synchronous and asynchronous processing.
- Designed a scalable background processing architecture.
