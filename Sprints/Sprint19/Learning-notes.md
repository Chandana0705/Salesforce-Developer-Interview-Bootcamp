# Engineering Sprint 19 - Learning Notes

## Sprint Objective

The objective of this sprint was to move non-essential business operations to the background using Queueable Apex, allowing the user transaction to complete quickly while secondary processing continues asynchronously.

---

## What I Learned

### 1. Synchronous vs Asynchronous Processing

Not every operation should happen while the user waits.

Essential work should happen immediately.

Examples:
- Validate the application.
- Update Student records.
- Save important data.

Secondary work can happen later.

Examples:
- External system integration.
- Notification preparation.
- Analytics processing.

---

### 2. Queueable Apex

Queueable Apex executes background jobs after the current transaction completes.

It is useful when:

- Processing does not require an immediate response.
- Complex business logic needs to run asynchronously.
- Future chaining of jobs may be required.

---

### 3. System.enqueueJob()

Queueable jobs are submitted using:

```apex
System.enqueueJob(new PlacementPostProcessingJob(applicationId));
```

This places the job into Salesforce's asynchronous queue.

---

### 4. Passing Only Required Data

Instead of passing an entire Application object, only the Application Id is passed.

Example:

```apex
new PlacementPostProcessingJob(applicationId);
```

The Queueable class queries the latest data during execution.

Benefits:

- Lower memory usage.
- Uses the latest database values.
- Cleaner design.

---

### 5. Single Responsibility Principle

Each Queueable class should have only one responsibility.

Our Queueable class performs:

- External synchronization
- Notification preparation
- Analytics preparation

The Student update remains inside the synchronous transaction.

---

### 6. Transaction Boundary

The business transaction is divided into two parts.

Immediate Transaction

- Validate data
- Update Student
- Save records
- Return success

Background Transaction

- External integration
- Notifications
- Analytics

---

## Architecture

Student
↓

Trigger
↓

Service Layer
↓

Update Student

↓

System.enqueueJob()

↓

PlacementPostProcessingJob

↓

External Sync

↓

Notification Processing

↓

Analytics

---

## Key Takeaways

- Queueable Apex improves user experience.
- Essential work should remain synchronous.
- Secondary work should execute asynchronously.
- Pass only required information to Queueable Apex.
- Separate responsibilities for maintainable code.
