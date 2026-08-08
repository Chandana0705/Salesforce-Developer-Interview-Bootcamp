# Challenges Faced – Sprint 23

## 1. Connecting LWC with Apex

### Challenge

Initially, the LWC used:

```text
getCompanies()
```

This returned company records but did not apply the student's eligibility rules.

### Solution

The controller was changed to:

```text
getEligibleJobs()
```

The controller retrieves the student and companies and calls:

```text
JobEligibilityService.isEligible()
```

Only eligible companies are returned to the LWC.

---

## 2. Keeping Business Logic Out of JavaScript

### Challenge

The eligibility conditions could have been written directly inside the LWC JavaScript.

For example:

```text
CGPA >= Minimum CGPA
Branch == Required Branch
Backlogs <= Allowed Backlogs
```

### Solution

The eligibility rules were kept in:

```text
JobEligibilityService.cls
```

The LWC only receives and displays the result.

This keeps the business logic separate from the UI.

---

## 3. Salesforce CLI Authorization Error

### Challenge

During deployment, Salesforce CLI showed:

```text
Could not authorize your org because local port 1717 is already in use.
```

### Investigation

I checked which process was using port 1717:

```powershell
netstat -ano | findstr :1717
```

The command returned a process ID.

### Solution

The process was terminated using:

```powershell
taskkill /PID <PID> /F
```

The port was checked again.

After the `LISTENING` process was removed, Salesforce authorization worked successfully.

### Learning

Not every deployment problem is caused by the application code.

Some problems can come from the local development environment or Salesforce CLI.

---

## 4. Missing Job Details

### Challenge

The TCS job appeared on the page, but some fields were initially blank.

The page displayed:

```text
TCS
Deadline: 2026-08-21
```

but some other information was missing.

### Investigation

I checked:

```text
HTML
 ↓
JavaScript
 ↓
Apex Query
 ↓
Salesforce Record
```

The fields were already included in the code.

### Solution

The missing values were added to the TCS Company record in Salesforce.

After refreshing the page, the information appeared correctly.

### Learning

When data is missing from an LWC, the problem may be in the Salesforce record rather than in the component code.

---

## 5. View Details Button

### Challenge

Initially, clicking **View Details** did not visibly change the page.

The event handler was only identifying the selected Job Id.

### Solution

A `selectedJob` property was added:

```javascript
selectedJob = null;
```

The selected job was found using:

```javascript
this.selectedJob = this.jobs.find(
    job => job.Id === jobId
);
```

The HTML then conditionally displayed the selected job details.

### Result

The user can now:

```text
Click View Details
       ↓
See Job Details
       ↓
Click Close
```

---

## 6. Debugging Approach

Instead of changing code randomly, I learned to follow the data flow.

The debugging process is:

```text
User Action
     ↓
Event Handler
     ↓
JavaScript State
     ↓
Apex
     ↓
Salesforce Data
     ↓
Returned Result
     ↓
HTML
```

This helped identify whether a problem was in the UI, Apex, Salesforce data or the local environment.

---

## 7. Final Result

After resolving these challenges, the Eligible Jobs component successfully:

- Retrieves eligible jobs
- Displays job information
- Handles loading
- Handles empty results
- Handles errors
- Allows users to view job details
- Allows users to close job details
- Deploys successfully to Salesforce
