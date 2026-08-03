# Learning Notes – Sprint 04

## Overview

Sprint 4 focused on implementing eligibility validation before allowing a student to submit an application.

## Concepts Learned

- Learned how to retrieve a single record using SOQL.
- Understood how to query multiple Salesforce objects.
- Learned how to compare field values from different objects.
- Used comparison operators such as:
  - <
  - >
  - !=
- Learned how business rules are implemented in Apex.
- Understood the purpose of the `return` statement.
- Learned how validation prevents invalid records from being processed.

## Key Takeaways

- Business validations should always be performed before saving records.
- Query only the fields that are required.
- Multiple validations can be combined to enforce business rules.
- Using `return` avoids unnecessary processing once a validation fails.
