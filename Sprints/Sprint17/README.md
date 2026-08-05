# Sprint 17 – Bulk-Safe Eligibility Validation

## Objective

Implement bulk-safe eligibility validation for placement applications using Salesforce best practices.

---

## Business Requirement

The system should:

- Receive all applications together.
- Collect Student IDs.
- Collect Company IDs.
- Query Students only once.
- Query Companies only once.
- Store queried records in Maps.
- Validate every application using the Maps.
- Avoid SOQL queries inside loops.

---

## Tasks Completed

- Modified ApplicationTrigger to process multiple records.
- Refactored ApplicationService to accept a List<Application__c>.
- Used Set<Id> to collect Student and Company IDs.
- Queried Student and Company records only once.
- Used Maps for efficient record lookup.
- Performed validation without SOQL inside loops.

---

## Engineering Concepts

- Bulkification
- Governor Limits
- Set Collection
- Map Collection
- Single SOQL Query
- Enterprise Apex Design

---

## Source Code

- ApplicationTrigger.trigger
- ApplicationService.cls

---

## Expected Behaviour

When multiple Application records are inserted:

- All Student IDs are collected.
- All Company IDs are collected.
- One SOQL query retrieves Students.
- One SOQL query retrieves Companies.
- Each Application is validated.
- Invalid records are prevented from being saved.

---

## Learning Outcome

Learned how to write scalable Apex code by processing records in bulk instead of one record at a time.
