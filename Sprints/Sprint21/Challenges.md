# Engineering Sprint 21 – Challenges

## Challenge 1

Understanding why Batch Apex is required.

### Solution

Learned that large datasets exceed Governor Limits if processed synchronously.

---

## Challenge 2

Understanding the Batch lifecycle.

### Solution

Studied how start(), execute(), and finish() work together.

---

## Challenge 3

Processing records efficiently.

### Solution

Processed records inside execute() and performed one bulk update.

---

## Challenge 4

Understanding QueryLocator.

### Solution

Used Database.getQueryLocator() to retrieve only the records requiring updates.

---

## Challenge 5

Maintaining Bulkification.

### Solution

Avoided SOQL and DML inside loops.

---

## Overall Challenges

- Understanding Batch transactions
- Learning Batch architecture
- Bulk-safe coding
- Governor Limit awareness
