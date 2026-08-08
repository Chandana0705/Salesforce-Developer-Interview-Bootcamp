# Challenges Faced – Sprint 26

## 1. Eligible Jobs Component Became Crowded

### Challenge

The `eligibleJobs` component was handling many responsibilities.

It contained:

```text
Job Retrieval
Job Display
View Details
Apply
Application States
Loading
Error Handling
```

This made the component larger and harder to maintain.

### Solution

A separate child component was created:

```text
jobCard
```

The interface was divided into:

```text
eligibleJobs
      ↓
   jobCard
```

---

## 2. Deciding Parent and Child Responsibilities

### Challenge

I needed to decide which functionality should remain in the parent and which should move to the child.

### Solution

The parent handles overall state and coordination.

The child handles one individual Job Card.

```text
Parent
├── Retrieve Jobs
├── State
└── Apex

Child
├── Display Job
└── User Actions
```

---

## 3. Passing Job Information

### Challenge

After moving the Job Card UI into another component, the child needed access to the job record.

### Solution

The child uses:

```javascript
@api job;
```

The parent passes:

```html
job={job}
```

---

## 4. Apply Button Moved to Child

### Challenge

The Apply button now exists inside `jobCard`, but the application workflow is controlled by the parent.

### Solution

The child dispatches:

```javascript
new CustomEvent('apply', {
    detail: {
        jobId: this.job.Id
    }
})
```

The parent listens using:

```html
onapply={handleApply}
```

---

## 5. View Details Moved to Child

### Challenge

The View Details button also moved into the child, while the parent still owns the selected job.

### Solution

The child sends:

```javascript
new CustomEvent('viewdetails')
```

with the Job Id.

The parent receives the event and updates:

```javascript
selectedJob
```

---

## 6. Maintaining Apply State for Individual Jobs

### Challenge

The page contains multiple Job Cards.

Only the selected job should display:

```text
Submitting...
```

or:

```text
✓ APPLICATION SUBMITTED
```

### Solution

The parent stores:

```javascript
applyingJobId
```

and:

```javascript
appliedJobIds
```

The correct state is then passed to each Job Card.

---

## 7. Avoiding Duplicate Apex Calls

### Challenge

Each Job Card could have retrieved its own job information from Apex.

This would create unnecessary requests.

### Solution

Only the parent retrieves the job list.

The parent passes each job to the appropriate child.

```text
Apex
 ↓
Parent
 ↓
Children
```

---

## 8. Preserving Existing Functionality

### Challenge

Refactoring can accidentally break existing features.

### Solution

After refactoring, the following were tested again:

```text
Eligible Jobs
View Details
Apply
Submitting
Application Submitted
Failure Handling
```

All functionality continued to work correctly.

---

## 9. Final Result

The refactoring successfully separated the interface into meaningful components.

```text
eligibleJobs
      ↓
   jobCard
```

The architecture is now cleaner while preserving the existing Apply workflow.
