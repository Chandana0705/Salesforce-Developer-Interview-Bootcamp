# Sprint 28 – Student Profile Form

## Overview

Sprint 28 focused on creating a Student Profile Form in the Student Placement Portal. The form allows students to view and update their placement profile information.

The Student Profile component was added to the existing Eligible Jobs Lightning App Builder page.

## What Was Implemented

- Created the `StudentProfile` Lightning Web Component.
- Created a `StudentProfileController` Apex class to identify the current student's record.
- Added a `Student User` lookup field to connect the Student record with the Salesforce User.
- Used Lightning Data Service to display and update the Student record.
- Added fields for Phone, Email, Branch, CGPA, Skills, and Preferred Location.
- Added a Save Profile button.
- Added success and error handling.
- Added the Student Profile component to the existing Eligible Jobs Lightning App Builder page.

## Data Flow

```text
Salesforce User
      ↓
Student_User__c
      ↓
Student__c
      ↓
StudentProfile
      ↓
Lightning Data Service
      ↓
Update Profile
