# Sprint 25 Reflection

## 1. What Did I Learn?

Sprint 25 helped me understand the importance of representing different states in a user interface.

Instead of keeping the Apply button unchanged, the component now communicates the current status of the application.

---

## 2. Four-State Design

The Apply workflow now has four clear states:

```text
Ready
 ↓
Submitting
 ↓
Success
```

or:

```text
Ready
 ↓
Submitting
 ↓
Failure
```

This makes the user's journey easier to understand.

---

## 3. What Did I Learn About Component State?

I learned that JavaScript properties can control what the user sees.

For example:

```javascript
isApplying = false;
```

controls the processing state.

And:

```javascript
appliedJobIds = [];
```

keeps track of jobs successfully submitted during the component session.

---

## 4. What Did I Learn About Conditional Rendering?

I learned how LWC can display different UI elements depending on a condition.

For example:

```html
<template if:false={job.isApplied}>
```

shows the Apply button.

While:

```html
<template if:true={job.isApplied}>
```

shows:

```text
✓ APPLICATION SUBMITTED
```

---

## 5. What Did I Learn About Derived Data?

The Salesforce Job record does not need to be modified just to store temporary UI state.

Instead, I created:

```javascript
get displayJobs()
```

which adds:

```text
isApplied
```

for UI purposes.

This separates Salesforce data from temporary component state.

---

## 6. What Did I Learn About User Experience?

I learned that a successful backend operation should have a clear visual result.

For example:

```text
Apply
 ↓
Submitting...
 ↓
✓ APPLICATION SUBMITTED
```

The user can immediately understand what happened.

---

## 7. What Was Challenging?

The main challenge was changing the UI for only the job that was successfully applied for.

The component displays multiple jobs, so changing one job should not change every job.

The solution was to store the individual Job Ids in:

```javascript
appliedJobIds
```

and check each job separately.

---

## 8. How Did My Understanding Improve?

I now understand that component development involves more than displaying data.

A component also needs to represent:

```text
User Action
     ↓
Processing
     ↓
Result
```

This is important for creating a clear user experience.

---

## 9. What Would I Improve?

The current submitted state is maintained in the component's local state.

A future improvement would be to retrieve the student's existing applications from Salesforce when the component loads.

That would allow the submitted state to remain correct even after refreshing the page.

---

## 10. Final Reflection

Sprint 25 taught me that good UI design should communicate system state clearly.

The most important lesson I learned is:

> Every important user action should provide clear feedback about whether it is ready, processing, successful or failed.

The Eligible Jobs Apply workflow now provides this feedback through four explicit states.
