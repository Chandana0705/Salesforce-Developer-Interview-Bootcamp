# Candidate Recruitment API Contract

## 1. Purpose

This API is used to send selected student candidate information from the Salesforce Placement Management System to an external recruitment platform.

The integration is triggered when a student's application is selected for a job.

---

## 2. Endpoint

### Method

POST

### Endpoint

/candidates

### Purpose

Creates or submits a selected candidate in the external recruitment system.

---

## 3. Request

### Headers

```http
Content-Type: application/json