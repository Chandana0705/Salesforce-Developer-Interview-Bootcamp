# Sprint 26 Reflection

## 1. What Did I Learn?

Sprint 26 helped me understand why large UI components should be divided based on responsibilities.

The Eligible Jobs component was working correctly, but it was becoming crowded.

Creating a Job Card child component made the architecture clearer.

---

## 2. What Changed?

Before:

```text
eligibleJobs
    ↓
Handles Everything
```

After:

```text
eligibleJobs
      ↓
   jobCard
```

The parent and child now have separate responsibilities.

---

## 3. What Did I Learn About Parent Components?

The parent should manage information that affects the overall screen.

In this project, the parent manages:

```text
Job List
Application State
Selected Job
Apex Requests
```

---

## 4. What Did I Learn About Child Components?

The child should focus on one specific UI responsibility.

The Job Card focuses on:

```text
One Job
Job Information
View Details
Apply
Application State
```

---

## 5. What Did I Learn About @api?

I learned that `@api` allows data to flow from the parent to the child.

```text
Parent
 ↓
@api
 ↓
Child
```

For example:

```javascript
@api job;
```

allows the Job Card to receive a job from the Eligible Jobs parent.

---

## 6. What Did I Learn About Custom Events?

I learned that Custom Events allow communication in the opposite direction.

```text
Child
 ↓
Custom Event
 ↓
Parent
```

For example, the child can tell the parent:

```text
The student clicked Apply for this Job Id.
```

The parent then decides what should happen.

---

## 7. What Was Challenging?

The main challenge was deciding where each responsibility should belong.

I learned that the goal of refactoring is not simply to create more files.

The goal is to create clear component boundaries.

---

## 8. Why Is the New Architecture Better?

The new architecture separates:

```text
Data and State
      ↓
Parent

Presentation and Interaction
      ↓
Child
```

This makes the code easier to understand and maintain.

---

## 9. What Did I Learn About Data Retrieval?

I learned that child components should not unnecessarily retrieve data already available in the parent.

Instead:

```text
Apex
 ↓
Parent
 ↓
Child
```

This avoids duplicate retrieval.

---

## 10. What Did I Learn About Business Logic?

Business logic should remain outside the UI components.

The LWC should not decide eligibility.

The architecture remains:

```text
jobCard
   ↓
eligibleJobs
   ↓
ApplicationController
   ↓
ApplicationService
   ↓
JobEligibilityService
```

---

## 11. What Would I Improve?

In future development, more components can be introduced when there is a clear responsibility that deserves separation.

However, I would avoid creating components unnecessarily.

A component should have a clear purpose.

---

## 12. Final Reflection

Sprint 26 helped me understand component architecture in Lightning Web Components.

The most important concept I learned is:

```text
Parent → Child = @api

Child → Parent = Custom Events
```

The final architecture:

```text
eligibleJobs
      ↓
   jobCard
```

is cleaner and easier to maintain than keeping all functionality inside one component.
