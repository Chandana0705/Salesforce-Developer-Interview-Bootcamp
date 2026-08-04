# Sprint 14 – Updating Placement Statistics

## Objective

Implement Trigger-based automation that updates placement statistics whenever an application's status changes to **Selected**.

---

## Business Requirement

Whenever an Application becomes **Selected**, the Placement Office dashboard should automatically reflect the latest placement statistics.

---

## Tasks Completed

- Created an After Update Trigger.
- Detected status changes to "Selected".
- Delegated processing to StatisticsService.
- Kept the Trigger short and readable.

---

## Engineering Principle

The Trigger should coordinate business events instead of performing calculations.

Business logic belongs inside StatisticsService.

---

## Source Code

- ApplicationTrigger.trigger
- StatisticsService.cls

---

## Expected Behaviour

Whenever an application status changes to **Selected**:

- Trigger executes automatically.
- StatisticsService is called.
- Placement statistics are refreshed.

---

## Screenshots

- StatisticsService.cls
- ApplicationTrigger.trigger
- Execute Anonymous
- Debug Logs

---

## Learning Outcome

Learned how to delegate Trigger responsibilities to specialized Service classes, improving maintainability and scalability.
