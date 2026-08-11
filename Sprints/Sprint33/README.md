
# Sprint 33 – Integration Reliability

## Overview

Sprint 33 focused on improving the reliability of the external recruitment integration developed in Sprint 32.

The main goal was to make the Candidate Synchronization process reliable when the external API fails, while also preventing the same candidate from being submitted multiple times.

The implementation includes integration status tracking, retry tracking, error handling, last-attempt tracking, and duplicate prevention.

## Business Requirement

When a student is selected for a job, the candidate information is sent from Salesforce to the external recruitment system.

The integration must also be able to:

- Track the integration status.
- Record the last integration attempt.
- Store errors returned by the external system.
- Retry temporary server failures.
- Prevent duplicate candidate submissions.
- Allow administrators to understand the synchronization state.

The Sprint 33 design follows the integration reliability requirements described in the project specification.

## Integration Flow

```text
Application
     |
     | Status = Selected
     v
CandidateSyncQueueable
     |
     v
Named Credential
     |
     v
External Recruitment API
     |
     +--------------------+
     |                    |
     v                    v
 Success              Failure
     |                    |
     v                    v
Update Application   Retry / Failed
     |
     v
Integration Status
