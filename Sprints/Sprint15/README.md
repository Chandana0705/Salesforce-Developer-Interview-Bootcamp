# Sprint 15 – Sending Notifications

## Objective

Design a Trigger that delegates notification responsibilities to a dedicated NotificationService whenever important placement events occur.

---

## Business Requirement

Students should receive timely communication whenever important placement events occur.

Possible events include:

- Interview Scheduled
- Selected
- Rejected
- Offer Accepted

---

## Tasks Completed

- Created NotificationService.
- Modified ApplicationTrigger.
- Delegated notification responsibility.
- Kept Trigger free from business logic.

---

## Engineering Principle

The Trigger should know only **when** an event occurs.

NotificationService should know **how** notifications are handled.

---

## Source Code

- ApplicationTrigger.trigger
- NotificationService.cls

---

## Expected Behaviour

Whenever the Application Status changes:

- Trigger detects the event.
- NotificationService is called.
- Notification logic is executed.

---

## Learning Outcome

Learned to separate Trigger responsibilities from communication logic using a dedicated Service class.
