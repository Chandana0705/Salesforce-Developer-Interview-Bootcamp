# Challenges Faced – Sprint 24

## 1. Understanding Why Apply Should Use Imperative Apex

### Challenge

The Eligible Jobs component already used `@wire` to retrieve job data.

I initially needed to understand whether Apply should also use the Wire Service.

### Solution

Apply is an explicit user action.

Therefore, I used an imperative Apex call:

```javascript
await submitApplication({
    jobId: jobId
});
```

---

## 2. Passing the Correct Job Id

### Challenge

The Apply button appears for multiple jobs.

The system must know which job the student selected.

### Solution

The Job Id was added to the button:

```html
data-job-id={job.Id}
```

JavaScript then retrieves it:

```javascript
const jobId = event.currentTarget.dataset.jobId;
```

This ensures the selected job reaches Apex.

---

## 3. Student Record Lookup Error

### Challenge

The first version of the Application Service attempted to find the student using the Salesforce user's email:

```apex
WHERE Email__c = :UserInfo.getUserEmail()
```

This caused:

```text
List has no rows for assignment to SObject
```

because there was no matching Student record.

### Solution

For the current project/testing setup, the student record was retrieved from the available Student records.

The application workflow could then continue to the duplicate and eligibility checks.

---

## 4. Duplicate Application

### Challenge

After the first successful application, clicking Apply again returned:

```text
You have already applied for this company.
```

Initially, this looked like an error in the workflow.

### Investigation

The Application Service was correctly finding an existing Application record for the same student and company.

### Solution

No code change was required.

The duplicate validation was working correctly.

The existing test Application record was removed when a fresh successful application test was required.

---

## 5. Creating the Application Record

### Challenge

The Application object contains relationship and status fields that must be populated correctly.

### Solution

The Application Service creates the record using:

```apex
application.Student__c = student.Id;
application.Company__c = company.Id;
application.Status__c = 'Applied';
application.ApplicationDate__c =
    String.valueOf(Date.today());
```

---

## 6. Success Feedback

### Challenge

Creating the Application record successfully is not enough from the user's perspective.

The student needs confirmation.

### Solution

A Salesforce toast notification was added:

```javascript
new ShowToastEvent({
    title: 'Success',
    message: 'Application submitted successfully.',
    variant: 'success'
})
```

---

## 7. Failure Feedback

### Challenge

A backend error should not be shown as a confusing technical message.

### Solution

The LWC catches the error:

```javascript
catch (error) {
```

and extracts the useful message:

```javascript
if (error.body && error.body.message) {
    message = error.body.message;
}
```

The message is then displayed to the user.

---

## 8. Repeated Clicks

### Challenge

A student could click Apply multiple times while the Apex request is processing.

This could result in multiple requests being sent.

### Solution

The component uses:

```javascript
isApplying = false;
```

and disables the button while the request is running.

The label changes to:

```text
Submitting...
```

This improves the user experience while the backend duplicate check protects the data.

---

## 9. Final Result

After resolving these challenges, the Apply workflow successfully:

- Receives the correct Job Id
- Calls Apex imperatively
- Reuses eligibility logic
- Checks duplicate applications
- Creates Application records
- Displays success feedback
- Displays failure feedback
- Prevents repeated clicks during processing
