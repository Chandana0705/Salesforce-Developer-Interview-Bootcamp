# Learning Notes – Sprint 26

## 1. Component Refactoring

I learned that when one component starts handling too many responsibilities, it can be divided into smaller components.

Before refactoring:

```text
eligibleJobs
├── Retrieve Jobs
├── Display Jobs
├── View Details
├── Apply
└── Application States
```

After refactoring:

```text
eligibleJobs
      ↓
   jobCard
```

---

## 2. Parent Component

The `eligibleJobs` component is the parent.

It is responsible for:

- Retrieving jobs
- Maintaining overall state
- Handling Apex calls
- Managing selected job
- Coordinating Job Card components

---

## 3. Child Component

The `jobCard` component is the child.

It is responsible for:

- Displaying one job
- Displaying Apply state
- Handling button clicks
- Sending actions to the parent

---

## 4. Parent-to-Child Communication

I learned that data can be passed from a parent component to a child component.

```text
Parent
   ↓
Data
   ↓
Child
```

In this project:

```text
eligibleJobs
   ↓
job
   ↓
jobCard
```

---

## 5. @api Decorator

The child exposes public properties using `@api`.

```javascript
@api job;
@api isApplied = false;
@api isSubmitting = false;
```

The parent can then provide values to these properties.

---

## 6. Passing Data to Child

The parent uses:

```html
<c-job-card
    job={job}
    is-applied={job.isApplied}
    is-submitting={job.isSubmitting}>
</c-job-card>
```

This allows every Job Card to receive the information it needs.

---

## 7. Child-to-Parent Communication

I learned that a child communicates with its parent using Custom Events.

```text
Child
   ↓
Custom Event
   ↓
Parent
```

For example:

```javascript
new CustomEvent('apply')
```

is used when the student clicks Apply.

---

## 8. Passing Data Through Events

The child can send information through:

```javascript
detail
```

Example:

```javascript
detail: {
    jobId: this.job.Id
}
```

The parent receives it using:

```javascript
event.detail.jobId
```

---

## 9. View Details Event

View Details also uses a Custom Event.

```javascript
new CustomEvent('viewdetails', {
    detail: {
        jobId: this.job.Id
    }
})
```

The parent receives the Job Id and manages the selected job.

---

## 10. Parent Owns Overall State

The parent maintains:

```javascript
applyingJobId = null;
appliedJobIds = [];
```

This means the child does not control the entire application state.

It only receives the state required for its job.

---

## 11. Avoiding Duplicate Data Retrieval

I learned that every child component does not need to call Apex.

Instead:

```text
Parent
 ↓
Retrieve Data Once
 ↓
Pass Data to Children
```

This avoids unnecessary requests.

---

## 12. Business Logic Separation

The UI components do not contain eligibility business rules.

The architecture remains:

```text
LWC
 ↓
Controller
 ↓
Service
 ↓
Eligibility Service
```

The UI manages presentation and user interaction.

Apex manages business logic.

---

## 13. Main Learning

The most important concept I learned in Sprint 26 is:

```text
Parent → Child
      @api

Child → Parent
   Custom Events
```

This communication pattern helps create reusable and maintainable Lightning Web Components.
