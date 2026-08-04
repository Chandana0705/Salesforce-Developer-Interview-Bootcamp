# Sprint 11 – Updating Application Status

## 📌 Objective

The objective of Sprint 11 was to update the status of an existing application after the recruitment process progresses.

---

## 📖 Business Requirement

After a student submits an application, recruiters update the application status during different stages of the hiring process.

Possible status values include:

- Applied
- Shortlisted
- Interview Scheduled
- Selected
- Rejected

The application should retrieve the existing record, update the status, save the changes, and display a confirmation message.

---

## 🛠️ Tasks Completed

- Retrieved the existing Application record.
- Updated the Application Status field.
- Saved the updated record using the `update` DML statement.
- Displayed a confirmation message after successful update.
- Handled exceptions using a try-catch block.

---

## 💻 Source Code

The complete Apex implementation is available in the **Source-Code** folder.

---

## 📚 Salesforce Concepts Learned

- DML Update
- Updating Existing Records
- SOQL Query
- try-catch
- Exception Handling
- Business Transactions

---

## 🧪 Testing

- Retrieved an existing Application record.
- Updated the Status field.
- Executed the method using Execute Anonymous.
- Verified the updated status in Salesforce.
- Checked the Debug Log for confirmation.

---

## 📸 Screenshots

The Screenshots folder contains:

- Application Object
- Status Field
- Apex Class
- Execute Anonymous Window
- Debug Log
- Updated Application Record

---

## 🎯 Learning Outcome

By completing Sprint 11, I learned how to update existing Salesforce records using Apex and understood how DML update operations modify records already stored in the database.

---

## 🚀 Next Sprint

Sprint 12 focuses on completing the entire business transaction and returning a final confirmation to the user.
