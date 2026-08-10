# Sprint 27 – LWC Component Communication

## Overview

Sprint 27 focused on implementing communication between Lightning Web Components (LWCs) in the Student Placement Portal.

The `EligibleJobs` component acts as the parent component, while `JobCard` acts as the child component.

## What Was Implemented

- Implemented parent-to-child communication using `@api`.
- Implemented child-to-parent communication using Custom Events.
- Added `viewdetails` event from `JobCard` to `EligibleJobs`.
- Added `apply` event from `JobCard` to `EligibleJobs`.
- Passed the required `jobId` through the event.
- Handled the events in the parent component.
- Kept application submission logic in the parent and Apex layer.

## Component Communication

```text
EligibleJobs
     ↓
  JobCard
     ↓
Custom Event
     ↓
EligibleJobs
