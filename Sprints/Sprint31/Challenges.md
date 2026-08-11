# Challenges – Sprint 31

## Challenges Faced

### Challenge 1

Ensuring that the Student Profile and Eligible Jobs components remained synchronized after a profile update.

### Solution

Used the communication and refresh mechanism implemented in Sprint 29 so that Eligible Jobs refreshes after the Student Profile is successfully updated.

---

### Challenge 2

Connecting the JobCard component with the Eligible Jobs parent component.

### Solution

Used Custom Events to send View Details and Apply actions from JobCard to EligibleJobs.

---

### Challenge 3

Testing application creation through the Student Placement Portal.

### Solution

Selected a job that had not been previously applied for and submitted the application through the Apply button. A new application was created successfully.

---

### Challenge 4

Handling duplicate application attempts.

### Solution

Tested applying to a job that had already been applied for. The system displayed an appropriate "already applied" message and prevented another application from being created.

---

### Challenge 5

Verifying that a newly created application was visible to the student.

### Solution

After successfully submitting a new application, verified the My Applications section and confirmed that the new application information was displayed.

---

### Challenge 6

Testing the complete application instead of testing individual components separately.

### Solution

Performed an end-to-end test covering profile update, eligible job refresh, job details, application submission, duplicate handling, and My Applications.
