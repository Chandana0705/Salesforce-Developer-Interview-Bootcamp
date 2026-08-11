# Sprint 32 – External Recruitment Integration

## Overview

Sprint 32 focused on integrating the Student Placement Management System with an external recruitment platform.

The main objective was to send selected candidate information from Salesforce to an external REST API using Queueable Apex and a Named Credential.

## Business Requirement

When a student is selected for a job, the system should send the candidate information from Salesforce to an external recruitment platform.

## Architecture

```text
Application Status
        ↓
     Selected
        ↓
CandidateSyncQueueable
        ↓
    Build Request
        ↓
 Named Credential
        ↓
     REST API
        ↓
 Process Response
        ↓
 Update Application
