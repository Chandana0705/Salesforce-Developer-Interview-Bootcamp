# Engineering Sprint 20 – Challenges

## Challenge 1

Understanding Queueable Chaining.

### Solution

Learned that one Queueable job can enqueue another Queueable after successful execution.

---

## Challenge 2

Separating responsibilities.

### Solution

Created two Queueable classes.

Job A performs external synchronization.

Job B prepares notifications.

---

## Challenge 3

Understanding execution order.

### Solution

Job B starts only after Job A completes successfully.

---

## Challenge 4

Passing data between Queueables.

### Solution

Passed only the Application Id instead of the complete object.

---

## Challenge 5

Designing scalable architecture.

### Solution

Used multiple Queueables instead of one large Queueable class.

---

## Overall Challenges

- Learning Queueable Chaining
- Designing sequential workflows
- Understanding asynchronous execution
- Keeping responsibilities separate
