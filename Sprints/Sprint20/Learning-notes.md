# Engineering Sprint 20 – Learning Notes

## Sprint Objective

Learn how Queueable Apex jobs can be chained together to perform multiple asynchronous operations in sequence.

---

## What I Learned

### Queueable Chaining

One Queueable job can enqueue another Queueable job after it completes successfully.

Example:

Job A
↓
System.enqueueJob(Job B)

---

### Why Chain Queueable Jobs?

Instead of placing all logic inside one Queueable class, each Queueable performs one responsibility.

Example:

Job A
- External synchronization

Job B
- Notification preparation

This improves readability and maintenance.

---

### Benefits

- Better code organization
- Easier testing
- Easier debugging
- Reusable Queueable classes
- Cleaner architecture

---

### Data Passing

Only the Application Id is passed between Queueable jobs.

Each Queueable queries the latest record information when it executes.

---

### Failure Handling

If Job A fails:

- Job B should not execute.

This prevents incorrect notification processing.

---

## Key Concepts

- Queueable Chaining
- Sequential Processing
- Single Responsibility Principle
- Asynchronous Architecture
- Background Processing

---

## Interview Takeaways

Q: What is Queueable Chaining?

A:
Queueable Chaining is the process where one Queueable job enqueues another Queueable job after completing its task.

---

Q: Why not keep everything in one Queueable?

A:
Having one Queueable with many responsibilities makes the code difficult to maintain and violates the Single Responsibility Principle.

---

## Summary

This sprint taught me how to design modular asynchronous workflows by connecting multiple Queueable jobs together.
