
# Learning Notes – Sprint 32

## Overview

Sprint 32 focused on building an external recruitment integration for the Student Placement Management System.

The sprint introduced REST API communication, Queueable Apex, Named Credentials, External Credentials, JSON serialization, and HTTP response handling.

## Concepts Learned

- Learned what an API contract is and why it should be defined before implementation.
- Learned how REST APIs use HTTP methods such as POST.
- Learned how to construct an `HttpRequest` in Apex.
- Learned how to set the endpoint, HTTP method, headers, and request body.
- Learned how to serialize Apex data into JSON using `JSON.serialize()`.
- Learned how to send an HTTP request using `Http.send()`.
- Learned how to process an `HttpResponse`.
- Learned why external callouts are commonly performed asynchronously.
- Learned how Queueable Apex can perform HTTP callouts using `Database.AllowsCallouts`.
- Learned the purpose of Salesforce Named Credentials.
- Learned that credentials and secrets should not be hard-coded in Apex.
- Learned the difference between an External Credential and a Named Credential.
- Learned how permission sets provide access to an External Credential principal.
- Learned how an external response can be used to update the Salesforce Application record.
- Learned the importance of handling different HTTP response codes.
- Learned that Salesforce success and external-system success are separate concerns.

## Key Takeaways

- An API is a contract between two independent systems.
- Queueable Apex is useful when an external callout should not block the main Salesforce transaction.
- Named Credentials separate integration configuration from Apex business logic.
- JSON serialization makes request creation cleaner and safer.
- HTTP status codes provide meaningful information about the result of an integration.
- External integrations must be designed with failures in mind.
- Integration status should be tracked separately from the main business transaction.
- A mock API can be used when a real external system is not available for development and testing.
