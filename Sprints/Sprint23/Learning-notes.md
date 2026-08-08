# Learning Notes – Sprint 23

## 1. Lightning Web Components

Lightning Web Components are used to build user interfaces in Salesforce.

An LWC mainly contains:

```text
HTML
JavaScript
Metadata
```

### HTML

HTML is responsible for displaying the UI.

Example:

```html
<h2>{job.Name}</h2>
```

### JavaScript

JavaScript controls the component behaviour and state.

Example:

```javascript
jobs = [];
```

### Metadata

The `.js-meta.xml` file controls how the component can be used in Salesforce.

---

## 2. Data Binding

Data binding connects JavaScript data with HTML.

JavaScript:

```javascript
jobs = [];
```

HTML:

```html
{job.Name}
```

The HTML displays the value stored in the JavaScript property.

---

## 3. Displaying Multiple Records

LWC provides `for:each` to display multiple records.

Example:

```html
<template for:each={jobs} for:item="job">
```

This loops through the `jobs` array and creates a UI element for each job.

---

## 4. Wire Service

The Wire Service allows an LWC to receive Salesforce data reactively.

In this project:

```javascript
@wire(getEligibleJobs)
wiredJobs({ data, error }) {
```

The result can contain:

```text
data
```

or:

```text
error
```

---

## 5. Apex Controller

The Apex Controller acts as the connection between the LWC and the backend logic.

The LWC calls:

```text
getEligibleJobs()
```

The controller retrieves the required Salesforce data and calls the service layer.

---

## 6. Service Layer

The service layer contains business rules.

In this project:

```text
JobEligibilityService.cls
```

contains the eligibility checks.

---

## 7. Eligibility Checks

The service checks:

```text
CGPA
Branch
Backlogs
Graduation Year
Application Deadline
```

The LWC should not duplicate these rules.

---

## 8. Separation of Responsibilities

The architecture is:

```text
LWC
 ↓
Controller
 ↓
Service
 ↓
Salesforce Data
```

Each layer has a specific responsibility.

This makes the application easier to understand and maintain.

---

## 9. User Events

The component can respond to user actions.

Example:

```html
<lightning-button
    label="View Details"
    onclick={handleViewDetails}>
</lightning-button>
```

JavaScript handles the event:

```javascript
handleViewDetails(event) {
    // Handle selected job
}
```

The general flow is:

```text
User Action
     ↓
Event
     ↓
Event Handler
     ↓
Component Behaviour
```

---

## 10. Component State

The component maintains state using JavaScript properties.

Examples:

```javascript
jobs = [];
selectedJob = null;
isLoading = true;
errorMessage = '';
```

These properties determine what is displayed on the screen.

---

## 11. Loading State

While Apex is retrieving the jobs, the component displays a loading indicator.

This informs the user that the system is processing the request.

---

## 12. Success State

When jobs are successfully returned, the component displays the job cards.

---

## 13. Empty State

If there are no eligible jobs, the component displays:

```text
No eligible jobs are currently available.
```

A user-friendly message is better than displaying a technical message such as:

```text
0 records returned.
```

---

## 14. Error State

If something goes wrong while retrieving the jobs, the component displays:

```text
Unable to load eligible jobs.
```

Technical error information can be logged for developers without exposing unnecessary details to users.

---

## 15. View Details

The View Details functionality uses the selected job from the already-loaded array.

Example:

```javascript
this.selectedJob = this.jobs.find(
    job => job.Id === jobId
);
```

The selected job is then displayed in the HTML.

---

## 16. Important Architecture Principle

The UI should not make business decisions.

Instead:

```text
LWC
 ↓
Requests Business Action
 ↓
Apex
 ↓
Service
 ↓
Business Rules
```

This prevents business rules from being scattered across the application.

---

## 17. Main Concepts Learned

During Sprint 23, I practiced:

- Lightning Web Components
- HTML templates
- JavaScript
- Data binding
- `@wire`
- Apex
- SOQL
- Service layer
- User events
- `for:each`
- Component state
- Conditional rendering
- Loading states
- Empty states
- Error states
- Salesforce App Pages
- Salesforce CLI deployment

---

## 18. Main Learning

A good LWC is not only about displaying Salesforce data.

It should have:

- A clear responsibility
- Proper data retrieval
- Clear user interactions
- Proper UI states
- Separation between UI and business logic
- Maintainable architecture
