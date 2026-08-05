# Challenges – Sprint 18

## Challenge 1

Detecting whether the Application Status actually changed.

### Solution

Compared Trigger.new with Trigger.oldMap.

---

## Challenge 2

Processing multiple Application records efficiently.

### Solution

Collected Student IDs into a Set and queried Student records only once.

---

## Challenge 3

Avoiding Governor Limits.

### Solution

Performed one SOQL query and one DML statement outside loops.

---

## Challenge 4

Keeping Trigger logic simple.

### Solution

Moved all business logic into the StudentPlacementService class.

---

## Challenge 5

Updating related Student records.

### Solution

Stored Student records in a List, modified them, and updated them together.
