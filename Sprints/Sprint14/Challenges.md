# Challenges – Sprint 14

## Challenge 1

Understanding when placement statistics should be updated.

### Solution

Used an After Update Trigger because the application must already be saved before updating statistics.

---

## Challenge 2

Avoiding business logic inside the Trigger.

### Solution

Created a separate StatisticsService to handle statistics.

---

## Challenge 3

Detecting only genuine status changes.

### Solution

Compared Trigger.oldMap with Trigger.new and executed the service only when the status changed to "Selected".
