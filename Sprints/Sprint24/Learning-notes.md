# Learning Notes – Sprint 24

## 1. Imperative Apex

I learned that an explicit user action such as clicking an Apply button can use an imperative Apex call.

The basic flow is:

```text
User Action
    ↓
JavaScript
    ↓
Imperative Apex
    ↓
Apex Controller
    ↓
Service
```

---

## 2. Wire vs Imperative Apex

The Eligible Jobs list uses the Wire Service because the component needs data reactively.

The Apply action uses imperative Apex because the request should happen only when the student explicitly clicks Apply.

```text
Reactive Data
    ↓
@wire

Explicit User Action
    ↓
Imperative Apex
```

---

## 3. Passing Data from HTML to JavaScript

The selected Job Id is passed using:

```html
data-job-id={job.Id}
```

JavaScript retrieves it using:

```javascript
const jobId = event.currentTarget.dataset.jobId;
```

This allows the component to know which job the student selected.

---

## 4. Async and Await

The Apex call is asynchronous.

I used:

```javascript
const applicationId = await submitApplication({
    jobId: jobId
});
```

`await` allows the code to wait for the Apex response before continuing.

---

## 5. Try, Catch and Finally

The Apply method uses:

```javascript
try {
}
catch (error) {
}
finally {
}
```

### try

Contains the Apex request.

### catch

Handles errors.

### finally

Resets the processing state.

```javascript
this.isApplying = false;
```

---

## 6. Controller Responsibility

The Application Controller receives the request from the LWC.

```apex
@AuraEnabled
public static Id submitApplication(Id jobId) {
    return ApplicationService.submitApplication(jobId);
}
```

The controller does not contain the eligibility business rules.

---

## 7. Service Responsibility

The Application Service handles the actual application business logic.

It:

```text
Gets Student
Gets Company
Checks Duplicate
Checks Eligibility
Creates Application
Returns Result
```

---

## 8. Reusing Existing Business Logic

The existing:

```text
JobEligibilityService
```

is reused.

The Apply workflow does not create another set of eligibility conditions.

This prevents business rules from being duplicated.

---

## 9. Duplicate Validation

Before inserting an Application record, the service checks:

```text
Has this student already applied for this company?
```

If yes, the request is rejected.

This protects the database from duplicate applications.

---

## 10. User Feedback

I learned that a successful backend operation should also have a clear UI result.

Instead of only:

```javascript
console.log('Success');
```

the component displays:

```text
Application submitted successfully.
```

using a toast notification.

---

## 11. Error Handling

I learned that technical errors should not simply be exposed to users.

The component catches the Apex error and displays a useful message.

For example:

```text
You have already applied for this company.
```

instead of showing a technical exception.

---

## 12. Processing State

The component uses:

```javascript
isApplying = false;
```

When Apply is clicked:

```javascript
isApplying = true;
```

The button changes from:

```text
Apply
```

to:

```text
Submitting...
```

and is disabled.

After the request:

```javascript
isApplying = false;
```

---

## 13. Backend vs Frontend Protection

The frontend prevents accidental repeated clicks.

The backend prevents duplicate data.

Therefore both layers are important:

```text
Frontend
    ↓
Better User Experience

Backend
    ↓
Data Integrity
```

---

## 14. Main Learning

The most important lesson from Sprint 24 was understanding the complete journey of a user action:

```text
Button
 ↓
JavaScript
 ↓
Apex Controller
 ↓
Service
 ↓
Database
 ↓
Result
 ↓
UI
```

This helped me understand how the LWC fits into the overall Salesforce architecture.
