# Sprint 03 – Duplicate Application Validation

## 📌 Objective

The objective of Sprint 3 was to prevent students from submitting duplicate applications for the same company. This was achieved by querying existing application records before processing a new application.

---

## 📖 Business Requirement

Before accepting a new application, the system should verify whether the student has already applied for the same company. If a duplicate application exists, the application should not proceed, and an appropriate message should be displayed.

---

## 🛠️ Tasks Completed

- Queried existing application records using SOQL.
- Used the Student Id and Company Id to search for matching applications.
- Stored the query results in a List.
- Checked whether the List contained any records using `size()`.
- Displayed appropriate debug messages for duplicate and non-duplicate scenarios.

---

## 💻 Source Code

```apex
List<Application__c> existingApplications = [
    SELECT Id
    FROM Application__c
    WHERE Student__c = :studentId
    AND Company__c = :jobId
];

if(existingApplications.size() > 0){

    System.debug('Duplicate Application Found');

}
else{

    System.debug('Application Accepted');

}
```

---

## 📚 Salesforce Concepts Learned

- SOQL (Salesforce Object Query Language)
- WHERE Clause
- Variable Binding (`:`)
- List Collection
- size() Method
- if-else Statements

---

## 🧪 Testing

- Created sample Student and Company records.
- Executed the `submitApplication()` method using Execute Anonymous.
- Verified duplicate detection using Debug Logs.

---

## 📸 Screenshots

Screenshots included in the `Screenshots` folder:

- Execute Anonymous Window
- Debug Log
- Duplicate Validation Output

---

## 🎯 Learning Outcome

By completing Sprint 3, I learned how to query Salesforce records using SOQL, store query results in a List, and implement duplicate validation using conditional statements before processing business logic.

---

## 🚀 Next Sprint

In Sprint 4, student eligibility validation (CGPA, Branch, Backlogs, and Graduation Year) will be implemented before allowing an application.
