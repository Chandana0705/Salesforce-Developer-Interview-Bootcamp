# Sprint 29 – Consistent Student Experience

## Overview

Sprint 29 focused on keeping the Student Profile and Eligible Jobs components synchronized after the student updates their profile information.

The main objective was to make sure that changes to the Student record are reflected in the Eligible Jobs component instead of displaying stale eligibility information.

## What Was Implemented

- Implemented communication between the Student Profile and Eligible Jobs components.
- Created a `StudentPortal` parent component to coordinate communication.
- Added a `profilesaved` Custom Event in the Student Profile component.
- Added a refresh method to the Eligible Jobs component.
- Used `refreshApex()` to refresh the eligible jobs data after the profile is updated.
- Ensured that updated student information is reflected in the Eligible Jobs component.
- Added the Student Portal component to the existing Lightning App Builder page.

## Communication Flow

```text
StudentProfile
      ↓
profilesaved Event
      ↓
StudentPortal
      ↓
refreshJobs()
      ↓
EligibleJobs
      ↓
refreshApex()
      ↓
Updated Eligible Jobs
