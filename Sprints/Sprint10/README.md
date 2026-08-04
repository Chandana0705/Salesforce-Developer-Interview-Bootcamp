# Sprint 10 – Creating and Saving the Application

## 📌 Objective

The objective of Sprint 10 was to create a new Application record after all business validations were completed successfully and store it in Salesforce using DML.

---

## 📖 Business Requirement

Once the student passes all eligibility validations and no duplicate application exists, the application should be recorded in Salesforce.

The system should:

- Create a new Application record.
- Populate all required fields.
- Save the record using DML.
- Display a confirmation message after successful insertion.

---

## 🛠️ Tasks Completed

- Created a new Application record.
- Assigned Student, Company, and Application Date values.
- Populated the required fields.
- Saved the record using the `insert` DML statement.
- Used exception handling to manage insertion failures.
- Displayed meaningful success and failure messages.

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
- Business Transactions

---

## 🧪 Testing

- Tested successful application creation.
- Verified that the record was inserted into the Application object.
- Tested record creation using Execute Anonymous.
- Verified success and error messages using Debug Logs.

---

## 📸 Screenshots

The Screenshots folder contains:

- ApplicationService Class
- DML Insert Code
- Execute Anonymous Window
- Debug Log
- Application Record Created Successfully

---

## 🎯 Learning Outcome

By completing Sprint 10, I learned how to create Salesforce records using DML and understood why database operations should only occur after all business validations have been completed.

---

## 🚀 Next Sprint

Sprint 11 focuses on updating the status of an existing application after recruiter actions.
