# Sprint 24 Reflection

## 1. What Did I Learn?

Sprint 24 helped me understand how a user action in an LWC can travel through the complete Salesforce application architecture.

The complete flow is:

```text
User
 ↓
LWC
 ↓
Apex Controller
 ↓
Service Layer
 ↓
Database
 ↓
Result
 ↓
LWC
```

---

## 2. What Changed in My Understanding?

Before Sprint 24, I mainly focused on retrieving and displaying Salesforce data.

During this sprint, I learned how an LWC can also initiate a business operation.

The Apply button is not just a UI element.

It starts a complete backend process.

---

## 3. What Did I Learn About Imperative Apex?

I learned that imperative Apex is useful when the server action should happen because of an explicit user action.

For example:

```text
Student clicks Apply
        ↓
Call Apex
```

This is different from automatically receiving reactive data through `@wire`.

---

## 4. What Did I Learn About Layered Architecture?

The Apply workflow follows:

```text
LWC
 ↓
ApplicationController
 ↓
ApplicationService
```

The LWC handles user interaction.

The Controller receives the request.

The Service handles the business logic.

This keeps responsibilities separated.

---

## 5. What Did I Learn About Business Logic?

The eligibility rules were already implemented in:

```text
JobEligibilityService
```

Instead of copying the same conditions into JavaScript, the Application Service calls the existing service.

This prevents duplication.

---

## 6. What Did I Learn About Duplicate Validation?

I learned that the frontend should not be the only protection against duplicate applications.

The backend checks whether an Application already exists for:

```text
Student + Company
```

If one exists, the application is rejected.

This protects data integrity even if another request reaches the backend.

---

## 7. What Did I Learn About User Experience?

I learned that backend success alone does not mean the user experience is complete.

After clicking Apply, the user should know what is happening.

The component therefore changes:

```text
Apply
```

to:

```text
Submitting...
```

and then shows the result.

---

## 8. What Did I Learn From Error Handling?

I learned that errors have two audiences.

### User

The user needs to know:

```text
What happened?
What can I do next?
```

### Developer

The developer needs:

```text
What failed?
Where did it fail?
Why did it fail?
```

Therefore, the UI displays useful business messages while technical details can remain in developer logs.

---

## 9. Most Important Challenge

One important debugging issue was:

```text
List has no rows for assignment to SObject
```

The problem was caused by the Student query not finding a matching record.

This taught me to inspect the actual Salesforce data when a SOQL query unexpectedly returns no records.

---

## 10. What Would I Improve?

The current workflow works for the project requirements.

For a more production-ready implementation, I would improve:

- Student identification using the authenticated user
- More robust handling when no Student record exists
- Better application status management
- More persistent application state in the UI
- Additional test classes
- More detailed user feedback

---

## 11. Can I Trace an Apply Request?

Yes.

```text
Student clicks Apply
        ↓
eligibleJobs.html
        ↓
handleApply()
        ↓
submitApplication()
        ↓
ApplicationController
        ↓
ApplicationService
        ↓
Student + Company retrieved
        ↓
Duplicate check
        ↓
Eligibility check
        ↓
Application__c inserted
        ↓
Application Id returned
        ↓
Success Toast
```

If something fails:

```text
Apex Exception
      ↓
catch(error)
      ↓
Error Message
      ↓
Error Toast
```

---

## 12. Final Reflection

Sprint 24 helped me understand that a simple button can represent a complete business workflow.

The main lesson I learned is:

> The UI requests the action, while the backend business layer decides whether the action is valid.

The LWC should provide a simple user experience while the Apex service protects the business rules and database integrity.
