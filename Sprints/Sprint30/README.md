# Sprint 30 – Reusable Empty State

## Overview

Sprint 30 focused on creating a reusable Empty State Lightning Web Component for the Student Placement Portal.

The purpose of the component is to provide a meaningful message when no records are available instead of displaying a simple "No records found" message.

## What Was Implemented

- Created a reusable `EmptyState` Lightning Web Component.
- Added support for a dynamic title.
- Added support for a dynamic message.
- Added optional action label support.
- Used the `EmptyState` component inside the `EligibleJobs` component.
- Replaced the basic empty message with a meaningful empty-state UI.
- Kept the component reusable so it can be used by other components in the future.

## Component Structure

```text
EligibleJobs
      │
      └── EmptyState
             │
             ├── Title
             ├── Message
             └── Optional Action
