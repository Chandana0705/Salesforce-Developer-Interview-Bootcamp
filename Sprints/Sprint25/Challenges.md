# Challenges Faced – Sprint 25

## 1. Showing Different Apply States

### Challenge

The Apply button originally remained the same before, during and after the application request.

The user could not clearly see whether the application was being processed or completed.

### Solution

Four UI states were implemented:

```text
Apply
Submitting...
Application Submitted
Application Failed
```

---

## 2. Changing the Button Label

### Challenge

The button needed to display different labels depending on the current state.

### Solution

A getter was used:

```javascript
get applyButtonLabel() {
    return this.isApplying ? 'Submitting...' : 'Apply';
}
```

When:

```javascript
isApplying = false;
```

the button displays:

```text
Apply
```

When:

```javascript
isApplying = true;
```

it displays:

```text
Submitting...
```

---

## 3. Showing the Submitted State

### Challenge

After a successful application, the job should no longer display the Apply button.

### Solution

Successfully applied Job Ids are stored:

```javascript
appliedJobIds = [];
```

After success:

```javascript
this.appliedJobIds = [
    ...this.appliedJobIds,
    jobId
];
```

The UI checks whether the Job Id exists in this list.

---

## 4. Updating the Job Data for the UI

### Challenge

The Salesforce job records do not contain an `isApplied` field.

The UI still needed to know whether each job had been submitted.

### Solution

A derived list was created:

```javascript
get displayJobs() {
    return this.jobs.map(job => ({
        ...job,
        isApplied: this.appliedJobIds.includes(job.Id)
    }));
}
```

This adds UI-specific state without changing the Salesforce records.

---

## 5. Conditional Rendering

### Challenge

The component needed to display either:

```text
[ Apply ]
```

or:

```text
✓ APPLICATION SUBMITTED
```

for the same job.

### Solution

LWC conditional templates were used:

```html
<template if:false={job.isApplied}>
```

and:

```html
<template if:true={job.isApplied}>
```

---

## 6. Processing State

### Challenge

The user could potentially click Apply repeatedly while Apex was processing.

### Solution

The button is disabled when:

```javascript
isApplying = true;
```

and the label changes to:

```text
Submitting...
```

After Apex completes:

```javascript
this.isApplying = false;
```

---

## 7. Testing Different States

Each state was tested separately:

```text
Ready
   ↓
Submitting
   ↓
Success
```

and:

```text
Ready
   ↓
Submitting
   ↓
Failure
```

This helped verify that the UI changes correctly according to the result of the Apply operation.

---

## 8. Final Result

The Apply workflow now communicates its state clearly to the user.

The four states are:

```text
[ Apply ]

[ Submitting... ]

✓ APPLICATION SUBMITTED

Application Failed
<Useful explanation>
```
