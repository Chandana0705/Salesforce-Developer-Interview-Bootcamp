# Sprint 18 – Detecting Selection in Bulk

## Objective

Implement a bulk-safe solution to detect when an Application status changes to **Selected** and automatically update the corresponding Student records.

---

## Business Requirement

Whenever an Application status changes to **Selected**:

- Update the Student's Placement Status.
- Record the Selected Company.
- Prepare the Student for notification processing.
- Support bulk processing when multiple applications are updated together.

---

## Tasks Completed

- Created an After Update Trigger on Application.
- Compared Trigger.new and Trigger.oldMap to detect status changes.
- Collected Student IDs using a Set.
- Queried Student records using a single SOQL query.
- Updated Student records using one DML statement.
- Stored the selected Company for each Student.
- Followed Salesforce bulkification best practices.

---

## Concepts Covered

- Trigger.new
- Trigger.oldMap
- After Update Trigger
- Bulk Processing
- Sets
- Maps
- Governor Limits
- Single SOQL Query
- Single DML Statement

---

## Files

- ApplicationTrigger.trigger
- StudentPlacementService.cls

---

## Expected Output

Whenever an Application changes from any status to **Selected**:

- Student Placement Status becomes **Placed**.
- Selected Company is recorded.
- Student becomes ready for notification processing.

---

## Learning Outcome

This sprint helped me understand how to detect field changes using old and new values while processing multiple records efficiently without violating Governor Limits.
