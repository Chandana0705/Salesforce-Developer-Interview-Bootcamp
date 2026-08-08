# Sprint 23 – Eligible Jobs

## Building User Experiences with Lightning Web Components

## 📌 Overview

Sprint 23 focuses on building the first version of the **Eligible Jobs** component for a Student Placement Portal.

The main goal is to allow students to view placement opportunities for which they are eligible.

The component connects the Salesforce UI with the existing Apex business logic.

### Architecture

```text
Student
   ↓
Lightning Web Component
   ↓
Apex Controller
   ↓
Job Eligibility Service
   ↓
Salesforce Data
```

---

## 🎯 Business Problem

Students need a simple way to find placement opportunities that match their eligibility criteria.

Instead of displaying every company, the system checks the student's eligibility against each company and displays only the eligible jobs.

The eligibility criteria include:

- CGPA
- Branch
- Backlogs
- Graduation Year
- Application Deadline

---

## 🎯 Sprint Objective

Build an **Eligible Jobs Lightning Web Component** that can:

- Display eligible jobs
- Retrieve data from Salesforce
- Apply existing eligibility rules
- Display multiple job records
- Handle user interactions
- Display job details
- Handle Loading, Success, Empty and Error states

---

## 🛠️ Technologies Used

- Salesforce
- Lightning Web Components (LWC)
- Apex
- SOQL
- JavaScript
- HTML
- Salesforce Lightning Design System (SLDS)
- Salesforce CLI
- Visual Studio Code

---

# 🏗️ Component Architecture

```text
Eligible Jobs App Page
        ↓
   eligibleJobs
      LWC
        ↓
EligibleJobsController
        ↓
JobEligibilityService
        ↓
Student__c + Company__c
```

---

## 📁 Project Components

### 1. Eligible Jobs LWC

Component:

```text
eligibleJobs
```

Responsibilities:

- Display jobs
- Receive data from Apex
- Render multiple jobs
- Handle user actions
- Display selected job details
- Handle loading, empty and error states

---

### 2. EligibleJobsController

The Apex controller is responsible for:

- Retrieving student information
- Retrieving company information
- Calling the eligibility service
- Returning eligible companies to the LWC

Main method:

```apex
getEligibleJobs()
```

---

### 3. JobEligibilityService

The service layer contains the business rules used to determine whether a student is eligible for a company.

The LWC does not contain these business rules.

---

# 📋 Eligibility Rules

The following eligibility checks are implemented:

### 1. CGPA

The student's CGPA must satisfy the company's minimum CGPA requirement.

### 2. Branch

The student's branch must match the company's required branch.

### 3. Backlogs

The student's backlogs must not exceed the company's allowed backlog limit.

### 4. Graduation Year

The student's graduation year must satisfy the company's graduation year requirement.

### 5. Application Deadline

The company's application deadline must not have passed.

---

# 🔄 Data Flow

When the Eligible Jobs page loads:

```text
LWC
 ↓
getEligibleJobs()
 ↓
EligibleJobsController
 ↓
Retrieve Student
 ↓
Retrieve Companies
 ↓
Check Each Company
 ↓
JobEligibilityService
 ↓
Eligible Companies
 ↓
LWC
 ↓
Display Job Cards
```

---

# 💻 LWC Data Binding

The JavaScript component stores jobs in an array:

```javascript
jobs = [];
```

The HTML template uses `for:each` to display multiple jobs:

```html
<template for:each={jobs} for:item="job">
```

Each job is identified using its Salesforce record Id.

---

# 💼 Job Card

Each job card displays:

- Company Name
- Job Role
- Package
- Location
- Application Deadline

Example:

```text
TCS
Software Engineer
Package: 700000
Location: Hyderabad
Deadline: 2026-08-21
```

---

# 👁️ View Details

The component also provides a **View Details** button.

The flow is:

```text
Job Card
   ↓
View Details
   ↓
Selected Job
   ↓
Job Details
   ↓
Close
```

The selected job is obtained from the already-loaded `jobs` array.

This avoids an unnecessary additional server request.

---

# 🔄 UI States

The component handles four important states.

## Loading

While Salesforce data is being retrieved:

```text
Loading eligible jobs...
```

## Success

When eligible jobs are available, job cards are displayed.

## Empty

When no eligible jobs are available:

```text
No eligible jobs are currently available.
```

## Error

If the Apex request fails:

```text
Unable to load eligible jobs.
```

---

# 🗂️ Salesforce Objects

## Student__c

Relevant fields:

```text
StudentCGPA__c
Branch__c
Backlogs__c
GraduationYear__c
```

## Company__c

Relevant fields:

```text
Name
JobRole__c
Package__c
CompanyLocation__c
LastDateToApply__c
MinimumCGPA__c
Branch__c
Allowed_Backlogs__c
Graduation_Year_Requirement__c
```

---

# 📂 Project Structure

```text
force-app/
└── main/
    └── default/
        ├── classes/
        │   ├── EligibleJobsController.cls
        │   ├── EligibleJobsController.cls-meta.xml
        │   ├── JobEligibilityService.cls
        │   └── JobEligibilityService.cls-meta.xml
        │
        └── lwc/
            └── eligibleJobs/
                ├── eligibleJobs.html
                ├── eligibleJobs.js
                └── eligibleJobs.js-meta.xml
```

---

# 🚀 Deployment

The Salesforce project was deployed using Salesforce CLI.

```powershell
sf project deploy start
```

The component was then added to a Salesforce App Page and tested.

---

# 🧪 Verification

The component was successfully verified on the Salesforce App Page.

The following functionality was tested:

- Eligible job displayed
- Job Role displayed
- Package displayed
- Location displayed
- Application deadline displayed
- View Details button works
- Job Details displayed
- Close button works
- Loading state implemented
- Empty state implemented
- Error state implemented

---

# 🧠 Engineering Decisions

## 1. Business Logic Remains in Apex

Eligibility rules are kept inside:

```text
JobEligibilityService.cls
```

instead of duplicating them in JavaScript.

This keeps the UI focused on presentation and interaction.

---

## 2. Wire Service for Data Retrieval

The component uses the LWC Wire Service to retrieve eligible jobs when the component loads.

---

## 3. Dynamic Job Rendering

The component uses an array and `for:each` instead of hard-coding individual job cards.

---

## 4. UI States

Loading, Success, Empty and Error states are considered instead of designing only for the successful case.

---

## 5. Existing Data Used for View Details

The View Details feature uses the already-loaded job list instead of making another server request.

---

# ✅ Definition of Done

- [x] Component has one clear responsibility
- [x] Business rules are not unnecessarily duplicated in JavaScript
- [x] Data is retrieved intentionally
- [x] Variable and method names communicate purpose
- [x] User actions are handled clearly
- [x] Loading behaviour is considered
- [x] Empty data is considered
- [x] Error behaviour is considered
- [x] Component is understandable by another developer

---

# 🎓 Sprint Outcome

The first version of the Eligible Jobs component has been successfully built and deployed.

The student can now:

```text
Open Eligible Jobs
       ↓
View Eligible Opportunities
       ↓
Select a Job
       ↓
View Job Details
       ↓
Close Details
```

---

# 🔜 Next Step

The next part of the sprint will make the Eligible Jobs component interactive by implementing the **Apply workflow**.

The planned flow is:

```text
Apply Button
     ↓
Event Handler
     ↓
Imperative Apex
     ↓
Application Service
     ↓
Application Created
     ↓
Result Returned
     ↓
UI Updated
```
