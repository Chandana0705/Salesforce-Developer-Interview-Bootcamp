# Sprint 23 Reflection

## 1. What Did I Learn?

Sprint 23 helped me understand how Lightning Web Components connect the Salesforce UI with backend business logic.

I learned how to build an LWC that:

- Retrieves Salesforce data
- Displays multiple records
- Responds to user actions
- Maintains component state
- Communicates with Apex
- Handles different UI states

---

## 2. What Changed in My Understanding of LWC?

Before this sprint, I mainly understood LWC as a way to display Salesforce data.

After completing this sprint, I understand that an LWC also needs to:

- Manage UI state
- Handle user interactions
- Communicate with Apex
- Provide feedback to the user
- Work as part of a larger application architecture

---

## 3. What Did I Learn About Business Logic?

One of the most important lessons was that business rules should not be duplicated inside the UI.

The eligibility rules are kept in:

```text
JobEligibilityService.cls
```

The LWC requests the eligible jobs and displays the result.

The architecture is:

```text
LWC
 ↓
Apex Controller
 ↓
Service Layer
 ↓
Business Rules
```

This makes the application easier to maintain.

---

## 4. What Did I Learn About Data Binding?

I learned how JavaScript properties can be connected to HTML.

For example:

```javascript
jobs = [];
```

can be displayed using:

```html
{job.Name}
```

For multiple records, I used:

```html
<template for:each={jobs} for:item="job">
```

This helped me understand how LWC dynamically renders Salesforce records.

---

## 5. What Did I Learn From View Details?

The View Details functionality helped me understand component state and user events.

The flow is:

```text
User clicks View Details
        ↓
Event Handler
        ↓
Job Id identified
        ↓
Selected Job stored
        ↓
HTML displays details
```

This showed me how JavaScript behaviour controls what the user sees.

---

## 6. What Did I Learn About UI States?

I learned that an application should not be designed only for successful data retrieval.

The component should consider:

```text
LOADING
SUCCESS
EMPTY
ERROR
```

This makes the application more user-friendly.

---

## 7. What Was Challenging?

The Salesforce CLI authorization problem was one of the main challenges.

Port `1717` was already being used by another process.

I learned to investigate the problem using:

```powershell
netstat -ano | findstr :1717
```

and terminate the process using:

```powershell
taskkill /PID <PID> /F
```

This taught me that debugging can involve the development environment as well as the application code.

---

## 8. What Did I Learn From Debugging the Job Data?

When some TCS information was missing from the page, I initially checked the LWC code.

The code was correct.

The actual issue was that the corresponding Salesforce record did not contain values for some fields.

After updating the Salesforce record, the UI displayed the information correctly.

This taught me to trace the complete data path instead of assuming the problem is always in the code.

---

## 9. How Did My Debugging Approach Improve?

I learned to debug systematically:

```text
Check User Action
       ↓
Check Event Handler
       ↓
Check JavaScript State
       ↓
Check Apex
       ↓
Check Salesforce Data
       ↓
Check Returned Result
       ↓
Check HTML
```

This approach is more reliable than changing code randomly.

---

## 10. What Would I Improve?

The current implementation is the first version of the Eligible Jobs component.

The next improvements would include:

- Identifying the actual logged-in student
- Implementing the Apply workflow
- Calling Apex imperatively for Apply
- Creating application records
- Handling duplicate applications
- Showing processing feedback
- Showing success and failure messages
- Refreshing the UI after an application

---

## 11. Can I Explain the Complete Current Flow?

Yes.

```text
Student opens Eligible Jobs App Page
              ↓
EligibleJobs LWC loads
              ↓
Wire Service calls Apex
              ↓
EligibleJobsController executes
              ↓
Student and Company data retrieved
              ↓
JobEligibilityService checks eligibility
              ↓
Eligible jobs returned
              ↓
LWC displays job cards
              ↓
Student clicks View Details
              ↓
Selected job is stored
              ↓
Job details are displayed
```

---

## 12. Final Reflection

Sprint 23 helped me understand that building a Salesforce UI is not simply about writing HTML and JavaScript.

A good component should:

- Have a clear responsibility
- Retrieve data intentionally
- Keep business rules in the correct layer
- Respond to user actions
- Handle loading, empty and error states
- Provide useful feedback
- Be understandable and maintainable

The biggest lesson I learned is:

> The UI should make the user's journey simple, while the business layer handles the business decisions.
