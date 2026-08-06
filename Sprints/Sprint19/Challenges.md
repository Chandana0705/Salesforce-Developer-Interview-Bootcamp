# Engineering Sprint 19 - Challenges

## Challenge 1

Understanding which operations should execute immediately and which should execute in the background.

### Solution

Separated the transaction into:

- Essential synchronous work
- Secondary asynchronous work

---

## Challenge 2

Learning how Queueable Apex works.

### Solution

Created a Queueable class implementing the Queueable interface and submitted it using System.enqueueJob().

---

## Challenge 3

Understanding why only the record Id is passed.

### Solution

Learned that asynchronous jobs execute later, so querying the latest record state is better than passing the entire object.

---

## Challenge 4

Keeping responsibilities separate.

### Solution

StudentPlacementService updates Student records.

PlacementPostProcessingJob performs only background processing.

---

## Challenge 5

Maintaining bulk-safe code.

### Solution

Used collections and performed DML outside loops before enqueuing Queueable jobs.

---

## Overall Challenges Faced

- Understanding asynchronous execution
- Identifying transaction boundaries
- Separating responsibilities
- Designing scalable architecture
