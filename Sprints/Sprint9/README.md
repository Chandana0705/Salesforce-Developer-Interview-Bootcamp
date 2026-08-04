# Sprint 09 – Student Eligibility Validation

## 📌 Objective

The objective of Sprint 9 was to validate whether a student satisfies the company's eligibility criteria before allowing the application process to continue.

---

## 📖 Business Requirement

After retrieving both the Student and Company records, compare the student's academic details with the company's eligibility requirements. If any validation fails, the application should be rejected with an appropriate message.

The validation includes:

- Minimum CGPA
- Maximum Backlogs
- Eligible Branch
- Graduation Year

---

## 🛠️ Tasks Completed

- Retrieved Student details.
- Retrieved Company details.
- Compared Student CGPA with Company Minimum CGPA.
- Compared Student Backlogs with Company Maximum Backlogs.
- Compared Student Branch with Company Eligible Branch.
- Compared Student Graduation Year with Company Graduation Year.
- Displayed appropriate debug messages for validation failures.
- Allowed only eligible students to proceed.

---

## 💻 Source Code

The complete Apex implementation is available in the **Source-Code** folder.

---

## 📚 Salesforce Concepts Learned

- Business Rule Validation
- Conditional Statements
- Comparison Operators
- Multiple Validation Checks
- return Statement
- Apex Decision Making

---

## 🧪 Testing

- Tested students meeting all eligibility requirements.
- Tested students with insufficient CGPA.
- Tested students exceeding maximum backlogs.
- Tested branch mismatch.
- Tested graduation year mismatch.
- Verified all results using Debug Logs.

---

## 📸 Screenshots

The Screenshots folder contains:

- Student Query
- Company Query
- Validation Code
- Execute Anonymous Window
- Debug Log

---

## 🎯 Learning Outcome

By completing Sprint 9, I learned how business rules are implemented using Apex. I also understood how multiple validation checks ensure that only eligible students are allowed to apply.

---

## 🚀 Next Sprint

Sprint 10 focuses on creating and saving the Application record after all validations are completed successfully.
