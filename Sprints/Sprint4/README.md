# Sprint 04 – Student Eligibility Validation

## 📌 Objective

The objective of Sprint 4 was to validate whether a student is eligible to apply for a company before processing the application. The system compares the student's academic details with the company's eligibility criteria.

---

## 📖 Business Requirement

Before accepting an application, the system should verify that the student satisfies all the company's eligibility requirements, including:

- Minimum CGPA
- Allowed Backlogs
- Branch
- Graduation Year

If any condition is not satisfied, the application should be rejected with an appropriate message.

---

## 🛠️ Tasks Completed

- Retrieved Student details using SOQL.
- Retrieved Company details using SOQL.
- Compared Student CGPA with Company Minimum CGPA.
- Validated the number of Backlogs.
- Compared Student Branch with Company Branch.
- Validated the Graduation Year.
- Displayed meaningful messages for each validation failure.
- Used `return` statements to stop execution when a validation failed.

---

## 💻 Source Code

The complete Apex implementation is available in the **Source-Code** folder.

---

## 📚 Salesforce Concepts Learned

- SOQL Queries
- Object Relationships
- Conditional Statements (`if`)
- Comparison Operators (`<`, `>`, `!=`)
- Business Rule Validation
- return Statement
- Querying Single Records

---

## 🧪 Testing

- Tested with eligible students.
- Tested students with low CGPA.
- Tested students with excess backlogs.
- Tested branch mismatch.
- Tested graduation year mismatch.
- Verified all debug messages using the Execute Anonymous Window.

---

## 📸 Screenshots

The Screenshots folder contains:

- Student Object Fields
- Company Object Fields
- Eligibility Validation Code
- Execute Anonymous Window
- Debug Log Output

---

## 🎯 Learning Outcome

By completing Sprint 4, I learned how to retrieve records from multiple Salesforce objects and compare their field values to implement business rules. I also learned how to stop execution using the `return` statement when validation fails.

---

## 🚀 Next Sprint

Sprint 5 focuses on saving eligible applications into Salesforce using DML operations and handling exceptions using try-catch.
