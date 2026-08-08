# Sprint 26 – Refactor Eligible Jobs into Components

## Overview

Sprint 26 focuses on refactoring the Eligible Jobs Lightning Web Component into a parent-child component architecture.

Previously, the `eligibleJobs` component was responsible for displaying every job card as well as handling View Details and Apply actions.

As the component grew, the UI became crowded.

To improve the component architecture, a new child component called `jobCard` was created.

The new structure is:

```text
eligibleJobs (Parent)
        ↓
     jobCard (Child)
```

The parent manages the overall job list and application state.

The child is responsible for displaying and handling interactions for one individual job.

---

## Sprint Objective

The objective of Sprint 26 is to:

1. Separate the Job Card from the main Eligible Jobs component
2. Create clear parent and child responsibilities
3. Pass data from parent to child
4. Send user actions from child to parent
5. Keep business logic outside UI components
6. Avoid duplicate data retrieval

---

## Technologies Used

- Salesforce
- Lightning Web Components (LWC)
- JavaScript
- HTML
- Apex
- `@api`
- Custom Events
- Salesforce Lightning Design System (SLDS)
- Salesforce CLI
- VS Code

---

# Component Architecture

Before refactoring:

```text
eligibleJobs
    │
    ├── Retrieve Jobs
    ├── Display Job Cards
    ├── View Details
    ├── Apply
    ├── Application States
    ├── Loading
    └── Error Handling
```

After refactoring:

```text
eligibleJobs
    │
    ├── Retrieve Jobs
    ├── Maintain Overall State
    ├── Handle Apex Requests
    └── Coordinate Components
             │
             ↓
          jobCard
             │
             ├── Display One Job
             ├── View Details
             ├── Apply
             └── Display Apply State
```

---

# Parent Component – eligibleJobs

The `eligibleJobs` component acts as the parent component.

Its main responsibilities are:

- Retrieve eligible jobs
- Maintain the job list
- Maintain application state
- Maintain the selected job
- Handle Apply requests
- Call Apex
- Handle success and failure
- Coordinate Job Card components

The parent owns the overall state of the screen.

---

# Child Component – jobCard

A new child component called:

```text
jobCard
```

was created.

The child represents one individual job.

Its responsibilities include:

- Display company name
- Display job role
- Display package
- Display location
- Display deadline
- Display View Details button
- Display Apply button
- Display application status
- Send user actions to the parent

---

# Parent-to-Child Communication

The parent passes data to the child using public `@api` properties.

In `jobCard.js`:

```javascript
@api job;
@api isApplied = false;
@api isSubmitting = false;
```

The parent passes these values using:

```html
<c-job-card
    job={job}
    is-applied={job.isApplied}
    is-submitting={job.isSubmitting}>
</c-job-card>
```

The data flow is:

```text
eligibleJobs
     ↓
 Job Information
     ↓
   jobCard
```

---

# Using @api

The `@api` decorator makes a child property publicly accessible to its parent.

For example:

```javascript
@api job;
```

allows the parent to provide a job record to the child.

The child can then display:

```html
<h2>{job.Name}</h2>

<p>{job.JobRole__c}</p>

<p>Package: {job.Package__c}</p>

<p>Location: {job.CompanyLocation__c}</p>
```

---

# Child-to-Parent Communication

The child communicates with the parent using Custom Events.

For example, when the user clicks Apply:

```javascript
handleApply() {

    this.dispatchEvent(
        new CustomEvent('apply', {
            detail: {
                jobId: this.job.Id
            }
        })
    );

}
```

The event contains:

```text
jobId
```

which identifies the selected job.

---

# Parent Listening to Custom Event

The parent listens for the Apply event:

```html
<c-job-card
    job={job}
    onapply={handleApply}>
</c-job-card>
```

The parent receives the Job Id using:

```javascript
const jobId = event.detail.jobId;
```

The flow becomes:

```text
Student
   ↓
Job Card
   ↓
Apply
   ↓
Custom Event
   ↓
Eligible Jobs Parent
   ↓
Apex
```

---

# View Details Event

The same parent-child communication pattern is used for View Details.

The child dispatches:

```javascript
this.dispatchEvent(
    new CustomEvent('viewdetails', {
        detail: {
            jobId: this.job.Id
        }
    })
);
```

The parent listens using:

```html
onviewdetails={handleViewDetails}
```

The parent then retrieves the selected job:

```javascript
handleViewDetails(event) {

    const jobId = event.detail.jobId;

    this.selectedJob = this.jobs.find(
        job => job.Id === jobId
    );

}
```

---

# Application State Management

The parent maintains the overall application state.

```javascript
applyingJobId = null;

appliedJobIds = [];
```

`applyingJobId` identifies the job currently being submitted.

`appliedJobIds` stores the jobs successfully applied for during the current component session.

---

# Derived Job State

The parent creates UI-specific job information using:

```javascript
get displayJobs() {

    return this.jobs.map(job => ({

        ...job,

        isApplied:
            this.appliedJobIds.includes(job.Id),

        isSubmitting:
            this.applyingJobId === job.Id

    }));

}
```

Each Job Card therefore receives its own application state.

---

# Apply States in Child Component

The Job Card displays the appropriate Apply state.

### Ready

```text
[ Apply ]
```

### Processing

```text
[ Submitting... ]
```

### Success

```text
✓ APPLICATION SUBMITTED
```

### Failure

```text
Application Failed
<Useful explanation>
```

The existing four-state Apply design continues to work after component refactoring.

---

# Complete Apply Flow

```text
Student
   ↓
jobCard
   ↓
Click Apply
   ↓
Custom Event
   ↓
eligibleJobs
   ↓
handleApply()
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
eligibleJobs updates state
   ↓
jobCard displays result
```

---

# Avoiding Duplicate Data Retrieval

The parent retrieves the eligible jobs once.

```text
EligibleJobsController
        ↓
eligibleJobs
        ↓
Job List
```

The child does not independently call Apex to retrieve the same job.

Instead:

```text
eligibleJobs
     ↓
passes job
     ↓
jobCard
```

This avoids unnecessary duplicate requests.

---

# Business Logic Separation

Business rules remain outside both UI components.

The LWC does not implement eligibility rules such as:

```text
CGPA
Branch
Backlogs
Graduation Year
Deadline
```

Those rules remain in Apex.

```text
LWC
 ↓
ApplicationController
 ↓
ApplicationService
 ↓
JobEligibilityService
```

This keeps the UI focused on presentation and interaction.

---

# Testing

The following functionality was tested after refactoring.

## Test 1 – Eligible Jobs

Expected:

```text
Eligible jobs should display correctly.
```

Result:

```text
Passed
```

---

## Test 2 – Job Card

Expected:

```text
Each job should appear as an individual Job Card.
```

Result:

```text
Passed
```

---

## Test 3 – View Details

Expected:

```text
View Details
     ↓
Child Event
     ↓
Parent
     ↓
Job Details Displayed
```

Result:

```text
Passed
```

---

## Test 4 – Apply

Expected:

```text
Apply
  ↓
Child Event
  ↓
Parent
  ↓
Apex
```

Result:

```text
Passed
```

---

## Test 5 – Submitting State

Expected:

```text
[ Apply ]
    ↓
[ Submitting... ]
```

Result:

```text
Passed
```

---

## Test 6 – Application Submitted

Expected:

```text
✓ APPLICATION SUBMITTED
```

Result:

```text
Passed
```

---

# Deployment

Sprint 26 changes were deployed using Salesforce CLI:

```powershell
sf project deploy start
```

The parent and child components were successfully deployed and tested on the Salesforce App Page.

---

# Definition of Done

- [x] Parent responsibility is clear
- [x] Child responsibility is clear
- [x] Job Card created as a child component
- [x] Data flows from parent to child
- [x] `@api` properties implemented
- [x] Custom Events implemented
- [x] Apply event communicates upward
- [x] View Details event communicates upward
- [x] Business logic remains outside UI components
- [x] Duplicate data retrieval is avoided
- [x] Apply states continue to work
- [x] Existing functionality remains working
- [x] Components deployed successfully
- [x] Functionality tested successfully

---

# Sprint Outcome

Sprint 26 successfully refactored the Eligible Jobs interface into a parent-child component architecture.

The final structure is:

```text
eligibleJobs
      ↓
   jobCard
```

The parent owns the overall state and coordinates application actions.

The child focuses on displaying one job and communicating user actions.

This makes the Eligible Jobs interface cleaner, easier to understand and easier to maintain.
