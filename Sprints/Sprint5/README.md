# Sprint 05 – Saving the Application Using DML

## 📌 Objective

The objective of Sprint 5 was to save an eligible student's application into Salesforce after all validations were completed successfully. The sprint also focused on handling exceptions that may occur during the record insertion process.

---

## 📖 Business Requirement

Once all validations are successful, create a new Application record and save it in Salesforce. If the record cannot be saved, display an appropriate error message instead of terminating the program unexpectedly.

---

## 🛠️ Tasks Completed

- Created a new Application record using Apex.
- Assigned Student, Company, and Application Date values.
- Used the `insert` DML statement to save the record.
- Implemented exception handling using `try-catch`.
- Displayed success and failure messages using `System.debug()`.
- Verified that the application record was created successfully.

---

## 💻 Source Code

The complete Apex implementation is available in the **Source-Code** folder.

---

## 📚 Salesforce Concepts Learned

- DML Operations
- insert Statement
- Creating Salesforce Records
- Exception Handling
- try-catch Block
- System.debug()

---

## 🧪 Testing

- Tested successful application creation.
- Verified that the record was inserted into the Application object.
- Tested error scenarios by intentionally leaving required fields empty.
- Verified error messages using Debug Logs.

---

## 📸 Screenshots

The Screenshots folder contains:

- ApplicationService Code
- Execute Anonymous Window
- Debug Log
- Successfully Created Application Record
- Application Object Records

---

## 🎯 Learning Outcome

By completing Sprint 5, I learned how to create and save records in Salesforce using DML operations. I also learned how exception handling improves application reliability by preventing unexpected failures during record insertion.

---

## 🚀 Next Sprint

Sprint 6 will focus on improving the application's design by separating business logic into reusable helper methods and enhancing code maintainability.
