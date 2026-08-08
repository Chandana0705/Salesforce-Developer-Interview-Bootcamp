# Sprint 25 – Design the Four Apply States

## Overview

Sprint 25 focuses on designing and implementing clear UI states for the Apply workflow in the Eligible Jobs Lightning Web Component.

The Apply action now communicates its current status to the student instead of showing the same button throughout the complete process.

The four states implemented are:

```text
Ready
  ↓
[ Apply ]

Submitting
  ↓
[ Submitting... ]

Success
  ↓
✓ APPLICATION SUBMITTED

Failure
  ↓
Application Failed
<Useful explanation>
```

---

## Sprint Objective

The objective of this sprint is to make the Apply workflow clear and user-friendly by explicitly representing:

1. Ready state
2. Submitting state
3. Success state
4. Failure state

---

## Technologies Used

- Salesforce
- Lightning Web Components (LWC)
- JavaScript
- Apex
- Salesforce Lightning Design System (SLDS)
- Salesforce CLI
- VS Code

---

# Apply State Flow

```text
Student sees eligible job
        ↓
      APPLY
        ↓
   User clicks
        ↓
    SUBMITTING
        ↓
   Apex request
        ↓
   ┌────┴────┐
   ↓         ↓
SUCCESS    FAILURE
   ↓         ↓
APPLICATION  ERROR
SUBMITTED    MESSAGE
```

---

# State 1 – Ready

Before the student applies, the job card displays:

```text
[ Apply ]
```

The button is enabled and ready for the user to submit an application.

---

# State 2 – Submitting

After clicking Apply:

```text
[ Submitting... ]
```

The Apply button is disabled while the Apex request is being processed.

This prevents repeated accidental clicks while the request is in progress.

The state is controlled using:

```javascript
isApplying = true;
```

The button label is determined using:

```javascript
get applyButtonLabel() {
    return this.isApplying ? 'Submitting...' : 'Apply';
}
```

---

# State 3 – Application Submitted

When the application is successfully created, the selected job is added to the applied job list.

```javascript
this.appliedJobIds = [
    ...this.appliedJobIds,
    jobId
];
```

The UI then changes from:

```text
[ Apply ]
```

to:

```text
✓ APPLICATION SUBMITTED
```

This gives the student a clear indication that the application was completed.

---

# State 4 – Failure

If the application fails, the job remains available for application.

The user receives an error toast.

Example:

```text
Application Failed

You have already applied for this company.
```

The error message is taken from the Apex response when available.

---

# State Management

The component uses:

```javascript
isApplying = false;
appliedJobIds = [];
```

### `isApplying`

Controls the processing state.

```text
false → Apply
true  → Submitting...
```

### `appliedJobIds`

Stores the Job Ids for applications successfully submitted during the current component session.

---

# Derived Job Data

The component creates a UI-friendly version of the job list:

```javascript
get displayJobs() {
    return this.jobs.map(job => ({
        ...job,
        isApplied: this.appliedJobIds.includes(job.Id)
    }));
}
```

This allows the HTML template to determine whether a particular job has already been successfully submitted.

---

# Conditional Rendering

The Apply button is displayed when the job has not been submitted:

```html
<template if:false={job.isApplied}>
```

The success state is displayed when the application has been submitted:

```html
<template if:true={job.isApplied}>
```

The success state displays:

```text
✓ APPLICATION SUBMITTED
```

---

# Complete User Experience

### Initial State

```text
Company: TCS
Job Role: Software Engineer

[ Apply ]
```

### During Submission

```text
Company: TCS
Job Role: Software Engineer

[ Submitting... ]
```

### After Success

```text
Company: TCS
Job Role: Software Engineer

✓ APPLICATION SUBMITTED
```

### If Application Fails

```text
Company: TCS
Job Role: Software Engineer

[ Apply ]

Application Failed
You have already applied for this company.
```

---

# Existing Apply Workflow

Sprint 25 builds on the Apply workflow implemented previously:

```text
Apply Button
      ↓
handleApply()
      ↓
Imperative Apex
      ↓
ApplicationController
      ↓
ApplicationService
      ↓
Duplicate Check
      ↓
Eligibility Check
      ↓
Application__c Created
      ↓
Result Returned
      ↓
UI State Updated
```

---

# Testing

The following states were tested:

## Test 1 – Ready

Expected:

```text
[ Apply ]
```

Result:

```text
Passed
```

---

## Test 2 – Submitting

Expected:

```text
[ Submitting... ]
```

The button should be disabled while the request is processing.

Result:

```text
Passed
```

---

## Test 3 – Successful Application

Expected:

```text
✓ APPLICATION SUBMITTED
```

Result:

```text
Passed
```

---

## Test 4 – Failed Application

Expected:

```text
Application Failed
<Useful explanation>
```

Result:

```text
Passed
```

---

# Deployment

The Sprint 25 changes were deployed using:

```powershell
sf project deploy start
```

The component was tested on the Salesforce App Page.

---

# Definition of Done

- [x] Ready state implemented
- [x] Submitting state implemented
- [x] Success state implemented
- [x] Failure state implemented
- [x] Apply button disabled during submission
- [x] Successful application changes the job state
- [x] Failure provides useful feedback
- [x] Four states tested
- [x] Changes deployed to Salesforce

---

# Sprint Outcome

Sprint 25 successfully makes the Apply workflow state-aware.

The student can clearly understand whether an application is:

```text
Ready
Submitting
Submitted
Failed
```

This improves the clarity and usability of the Eligible Jobs component.
