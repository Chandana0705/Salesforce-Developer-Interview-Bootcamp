# Sprint 16 – Preparing for Tomorrow's Requirements

## Objective

Extend the Placement Management System by notifying the Alumni Office whenever a student accepts an offer.

---

## Business Requirement

Whenever a student accepts an offer, the Alumni Office should automatically receive the student's details.

The existing Trigger should not be rewritten.

A new specialized service should be introduced.

---

## Tasks Completed

- Created AlumniService.
- Modified ApplicationTrigger to call AlumniService.
- Kept Trigger clean.
- Followed Service-Oriented Architecture.

---

## Engineering Principle

New business requirements should extend the system instead of modifying existing business logic.

Each responsibility belongs to its own Service class.

---

## Source Code

- ApplicationTrigger.trigger
- AlumniService.cls

---

## Expected Behaviour

Whenever an Application Status changes to **Offer Accepted**:

- Trigger executes automatically.
- AlumniService is called.
- Alumni Office notification process begins.

---

## Learning Outcome

Learned how enterprise applications support new business requirements by adding new Service classes instead of rewriting existing Trigger logic.
