# Sprint 24 – Apply Workflow

## Overview

Sprint 24 extends the Eligible Jobs component by allowing a student to apply for an eligible job.

The Apply workflow connects the Lightning Web Component with the Apex Controller and Application Service.

The complete flow is:

```text
Apply Button
     ↓
Event Handler
     ↓
Imperative Apex
     ↓
Application Controller
     ↓
Application Service
     ↓
Application Created
     ↓
Result Returned
```

---

## Business Requirement

A student viewing an eligible job should be able to submit an application.

The application should:

- Receive the correct Job Id
- Validate the application request
- Check whether the student is eligible
- Prevent duplicate applications
- Create an Application record
- Clearly communicate success
- Clearly communicate failure
- Prevent repeated accidental clicks

---

## Technologies Used

- Salesforce
- Lightning Web Components (LWC)
- Apex
- SOQL
- JavaScript
- Salesforce CLI
- VS Code

---

# Architecture

```text
EligibleJobs LWC
       |
       | Job Id
       ↓
handleApply()
       |
       | Imperative Apex
       ↓
ApplicationController
       |
       ↓
ApplicationService
       |
       ├── Duplicate Check
       |
       ├── Eligibility Check
       |
       ↓
Application__c
       |
       ↓
Result Returned
       |
       ↓
Success / Failure Toast
```

---

# Components Implemented

## 1. Apply Button

The Apply button is displayed for each eligible job.

```html
<lightning-button
    label={applyButtonLabel}
    variant="success"
    data-job-id={job.Id}
    onclick={handleApply}
    disabled={isApplying}>
</lightning-button>
```

The Job Id is passed from the HTML to JavaScript using:

```text
data-job-id
```

---

## 2. Event Handler

The `handleApply()` method receives the selected Job Id.

```javascript
const jobId = event.currentTarget.dataset.jobId;
```

This ensures that the application is submitted for the job selected by the student.

---

# 3. Imperative Apex

Because Apply is an explicit user action, the LWC calls Apex imperatively.

```javascript
const applicationId = await submitApplication({
    jobId: jobId
});
```

The Apex method is imported using:

```javascript
import submitApplication
from '@salesforce/apex/ApplicationController.submitApplication';
```

---

# 4. ApplicationController

The controller receives the Job Id and passes it to the service layer.

```apex
public with sharing class ApplicationController {

    @AuraEnabled
    public static Id submitApplication(Id jobId) {

        return ApplicationService.submitApplication(jobId);

    }
}
```

The controller does not contain the business rules.

---

# 5. ApplicationService

The Application Service handles the application business logic.

The service:

1. Retrieves the selected company/job
2. Retrieves the student
3. Checks for an existing application
4. Checks eligibility
5. Creates the Application record
6. Returns the Application Id

---

# Duplicate Application Check

Before creating a new application, the service checks whether the student has already applied for the selected company.

```apex
List<Application__c> existingApplications = [
    SELECT Id
    FROM Application__c
    WHERE Student__c = :student.Id
    AND Company__c = :company.Id
    LIMIT 1
];
```

If an application already exists:

```apex
throw new AuraHandledException(
    'You have already applied for this company.'
);
```

This prevents duplicate applications.

---

# Eligibility Validation

The existing eligibility service is reused:

```apex
if (!JobEligibilityService.isEligible(student, company)) {
    throw new AuraHandledException(
        'You are not eligible for this job.'
    );
}
```

Eligibility rules are not duplicated inside JavaScript.

---

# Application Creation

After validation succeeds, an `Application__c` record is created.

```apex
Application__c application = new Application__c();

application.Name =
    student.Name + ' - ' + company.Name;

application.Student__c = student.Id;
application.Company__c = company.Id;
application.Status__c = 'Applied';
application.ApplicationDate__c =
    String.valueOf(Date.today());

insert application;
```

The newly created Application Id is returned.

---

# Success Handling

After successful application submission, the LWC displays a success toast.

```javascript
this.dispatchEvent(
    new ShowToastEvent({
        title: 'Success',
        message: 'Application submitted successfully.',
        variant: 'success'
    })
);
```

The user receives clear feedback instead of only a console message.

---

# Failure Handling

If the application fails, the error is converted into a user-friendly message.

```javascript
let message = 'Unable to submit application.';

if (error.body && error.body.message) {
    message = error.body.message;
}
```

A failure toast is then displayed:

```javascript
this.dispatchEvent(
    new ShowToastEvent({
        title: 'Application Failed',
        message: message,
        variant: 'error'
    })
);
```

Example:

```text
Application Failed

You have already applied for this company.
```

---

# Preventing Repeated Clicks

The component uses:

```javascript
isApplying = false;
```

When the user clicks Apply:

```javascript
this.isApplying = true;
```

The button becomes:

```text
Submitting...
```

and is disabled while the Apex request is running.

After the request finishes:

```javascript
finally {
    this.isApplying = false;
}
```

The button becomes available again.

---

# Apply States

The current Apply workflow supports:

```text
Ready
 ↓
[ Apply ]

Processing
 ↓
[ Submitting... ]

Success
 ↓
Application submitted successfully.

Failure
 ↓
Application Failed
<Reason>
```

---

# Salesforce Object

The workflow creates records in:

```text
Application__c
```

Relevant fields:

```text
Name
Student__c
Company__c
Status__c
ApplicationDate__c
```

---

# Complete Request Flow

```text
Student
   ↓
Clicks Apply
   ↓
eligibleJobs.html
   ↓
handleApply()
   ↓
Imperative Apex
   ↓
ApplicationController
   ↓
ApplicationService
   ↓
Get Company
   ↓
Get Student
   ↓
Duplicate Check
   ↓
Eligibility Check
   ↓
Create Application__c
   ↓
Return Application Id
   ↓
Success Toast
```

If any validation fails:

```text
ApplicationService
       ↓
Exception
       ↓
LWC catch()
       ↓
Error Toast
```

---

# Testing

The following scenarios were tested:

### Successful Application

```text
Apply
 ↓
Submitting...
 ↓
Application Created
 ↓
Success Toast
```

### Duplicate Application

```text
Apply
 ↓
Submitting...
 ↓
Duplicate Check
 ↓
Application Failed
 ↓
You have already applied for this company.
```

### Processing State

```text
[ Apply ]
    ↓
[ Submitting... ]
```

The button is disabled while the request is being processed.

---

# Deployment

The changes were deployed using Salesforce CLI:

```powershell
sf project deploy start
```

The functionality was then tested on the Salesforce App Page.

---

# Definition of Done

- [x] Correct Job Id reaches JavaScript
- [x] Apex receives the correct request
- [x] Existing service logic is reused
- [x] Eligibility rules are not duplicated in JavaScript
- [x] Duplicate applications are handled
- [x] Success is clearly communicated
- [x] Failure is clearly communicated
- [x] Repeated accidental clicks are considered
- [x] Request can be traced from button to database

---

# Sprint Outcome

Sprint 24 successfully connects the Eligible Jobs UI with the application backend.

The student can now submit an application for an eligible job, while the backend protects the application process using eligibility and duplicate validation.

The next stage is to improve the Apply experience with clearer application states and UI architecture.
