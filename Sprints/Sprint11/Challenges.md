# Challenges – Sprint 11

## Challenge 1

Understanding when to use `update` instead of `insert`.

### Solution

Learned that `insert` creates a new record, while `update` modifies an existing record.

---

## Challenge 2

Retrieving the correct Application record.

### Solution

Used SOQL with the Application Id to retrieve the required record before updating it.

---

## Challenge 3

Understanding why the record must be queried first.

### Solution

Learned that Salesforce requires an existing record before updating any field values.

---

## Challenge 4

Handling update failures.

### Solution

Used a try-catch block to capture DML exceptions and display meaningful error messages.
