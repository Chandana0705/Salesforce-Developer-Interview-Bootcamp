# Learning Notes – Sprint 25

## 1. UI State

I learned that a user interface should clearly communicate what is happening after a user performs an action.

For the Apply workflow, four states are required:

```text
Ready
Submitting
Success
Failure
```

---

## 2. Ready State

The initial state is:

```text
[ Apply ]
```

The user can click the button to start the application process.

---

## 3. Submitting State

After clicking Apply, the component changes to:

```text
[ Submitting... ]
```

This is controlled using:

```javascript
isApplying = true;
```

The button is also disabled during this state.

---

## 4. Success State

After Apex successfully creates the Application record, the selected Job Id is stored:

```javascript
this.appliedJobIds = [
    ...this.appliedJobIds,
    jobId
];
```

The component then displays:

```text
✓ APPLICATION SUBMITTED
```

---

## 5. Failure State

If Apex returns an error, the component displays an error toast.

Example:

```text
Application Failed

You have already applied for this company.
```

The useful error message is extracted from the Apex response.

---

## 6. Component State

I learned that JavaScript properties can be used to control the UI.

The main properties are:

```javascript
isApplying = false;
appliedJobIds = [];
```

`isApplying` controls the processing state.

`appliedJobIds` controls which jobs display the submitted state.

---

## 7. Getters

I used a getter to change the button label:

```javascript
get applyButtonLabel() {
    return this.isApplying ? 'Submitting...' : 'Apply';
}
```

I also used a getter to create UI-specific job data:

```javascript
get displayJobs() {
    return this.jobs.map(job => ({
        ...job,
        isApplied: this.appliedJobIds.includes(job.Id)
    }));
}
```

---

## 8. Conditional Rendering

LWC conditional templates can display different content depending on the component state.

For example:

```html
<template if:false={job.isApplied}>
```

displays the Apply button.

And:

```html
<template if:true={job.isApplied}>
```

displays:

```text
✓ APPLICATION SUBMITTED
```

---

## 9. Array State

The applied Job Ids are stored in an array:

```javascript
appliedJobIds = [];
```

When a job is successfully submitted:

```javascript
this.appliedJobIds = [
    ...this.appliedJobIds,
    jobId
];
```

The spread operator creates a new array containing the previous values and the new Job Id.

---

## 10. UI and Backend State

The backend determines whether the application succeeds or fails.

The UI then represents the result.

```text
Backend Result
      ↓
UI State
      ↓
User Feedback
```

---

## 11. Main Learning

The main lesson from Sprint 25 is that a user should never have to guess what happened after clicking an action.

The UI should clearly communicate:

```text
What can I do?
     ↓
What is happening?
     ↓
Did it succeed?
     ↓
If not, why did it fail?
```

This makes the application easier to understand and use.
