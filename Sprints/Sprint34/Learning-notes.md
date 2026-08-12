# Learning Notes – Sprint 34

## Overview

Sprint 34 focused on integration architecture and selecting the appropriate integration approach for different business scenarios.

## Concepts Learned

- Learned the difference between synchronous and asynchronous integration.
- Learned when an immediate verification request should use synchronous processing.
- Learned how Queueable Apex can be used for asynchronous candidate synchronization.
- Learned how Scheduled Apex can start a recurring historical synchronization process.
- Learned how Batch Apex can process large numbers of records in manageable batches.
- Learned how external API integration can be combined with Batch Apex.
- Learned the importance of error handling in integration architecture.
- Learned how retry mechanisms can be included in historical synchronization.
- Learned why duplicate prevention is important in asynchronous integrations.
- Learned why Named Credentials should be used instead of hard-coded credentials.
- Learned the difference between point-to-point integration and middleware-based integration.
- Learned that integration architecture should scale with the number of external systems.

## Key Takeaways

- Use synchronous integration when the user needs the response immediately.
- Use asynchronous integration when the external operation can happen in the background.
- Queueable Apex is suitable for candidate synchronization that should not block the user.
- Scheduled Apex is suitable for recurring integration jobs.
- Batch Apex is suitable for processing large volumes of records.
- Integration logic should include error handling and controlled retries.
- Duplicate submissions should be prevented using an appropriate idempotency strategy.
- Named Credentials keep external authentication configuration separate from Apex code.
- Point-to-point integration may be suitable for simple integrations.
- Middleware becomes more useful when integration complexity and the number of external systems increase.
