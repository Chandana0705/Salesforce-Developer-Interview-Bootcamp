# Sprint 07 – Retrieving Student Information

## 📌 Objective

The objective of Sprint 7 was to retrieve the student's information before processing a placement application. The application requires student details to perform eligibility validation in the following sprints.

---

## 📖 Business Requirement

Before validating an application, the software must identify the student and retrieve only the information required for eligibility checking. Unnecessary fields should not be queried to improve performance.

---

## 🛠️ Tasks Completed

- Retrieved the Student record using SOQL.
- Queried only the required fields.
- Stored the Student record in an Apex object.
- Prepared the data for eligibility validation.

---

## 💻 Source Code

The complete Apex implementation is available in the **Source-Code** folder.

---

## 📚 Salesforce Concepts Learned

- SOQL
- Querying Single Records
- Field Selection
- Apex Objects
- Governor Limits
- Efficient Queries

---

## 🧪 Testing

- Retrieved an existing Student record.
- Verified the queried values.
- Confirmed that only required fields were retrieved.

---

## 📸 Screenshots

The Screenshots folder contains:

- Student Object
- SOQL Query
- Execute Anonymous Window
- Debug Log

---

## 🎯 Learning Outcome

By completing Sprint 7, I learned how to retrieve a single Salesforce record using SOQL and understood why professional developers query only the fields required for business decisions.

---

## 🚀 Next Sprint

Sprint 8 focuses on retrieving Company eligibility criteria required for application validation.
