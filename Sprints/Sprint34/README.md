# Sprint 34 – Integration Architecture Challenge

## Overview

Sprint 34 focused on designing integration architectures for different business requirements in the Student Placement Management System.

The sprint covered three integration scenarios:

1. Immediate Verification
2. Candidate Synchronisation
3. Historical Synchronisation

It also included an integration architecture review covering security, asynchronous processing, failure handling, duplicate prevention, and integration architecture.

## Integration A – Immediate Verification

### Requirement

When a student enters a certification number, Salesforce must verify it against an external service.

### Architecture

```text
Certification Number
        ↓
       LWC
        ↓
       Apex
        ↓
   External API
        ↓
     Response
        ↓
       LWC
