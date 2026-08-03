# Sprint 02 – Implementing the submitApplication() Method

## 📌 Objective

The objective of Sprint 2 was to implement the `submitApplication()` method inside the `ApplicationService` class. This method receives the required application details and confirms that the application request has been received successfully.

---

## 📖 Business Requirement

Implement a method named `submitApplication()` that accepts the following parameters:

- Student Id
- Company (Job) Id
- Application Date

Display a success message indicating that the application request has been received.

---

## 🛠️ Tasks Completed

- Added the `submitApplication()` method to the `ApplicationService` class.
- Passed three parameters:
  - `studentId`
  - `jobId`
  - `applicationDate`
- Displayed a success message using `System.debug()`.
- Tested the method using Execute Anonymous Window.
- Verified the output in the Debug Log.

---

## 💻 Source Code

```apex
public class ApplicationService {

    public static void submitApplication(
        Id studentId,
        Id jobId,
        Date applicationDate
    ) {

        System.debug('Application request received successfully.');

    }

}
```

---

## 📚 Salesforce Concepts Learned

- Methods in Apex
- Method Parameters
- Static Methods
- Data Types (`Id`, `Date`)
- `System.debug()`
- Execute Anonymous Window
- Debug Logs

---

## 🧪 Testing

Tested the method using Execute Anonymous.

```apex
ApplicationService.submitApplication(
    '001000000000001AAA',
    '001000000000002AAA',
    Date.today()
);
```

Expected Output

```
Application request received successfully.
```

---

## 📸 Screenshots

Screenshots included in the `Screenshots` folder:

- ApplicationService Class
- Execute Anonymous Window
- Debug Log
- Successful Execution

---

## 🎯 Learning Outcome

By completing Sprint 2, I learned how to create methods in Apex, pass parameters to methods, execute Apex code using the Execute Anonymous Window, and verify the output through Debug Logs.

---

## 🚀 Next Sprint

In Sprint 3, duplicate application validation will be implemented using SOQL queries.
