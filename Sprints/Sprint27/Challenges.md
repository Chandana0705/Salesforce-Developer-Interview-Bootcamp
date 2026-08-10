# Challenges – Sprint 27

## Challenges Faced

### Challenge 1

Understanding how the `JobCard` child component communicates with the `EligibleJobs` parent component.

### Solution

Learned that a child component can communicate with its parent using Custom Events. The `JobCard` dispatches events such as `viewdetails` and `apply`, and the `EligibleJobs` component handles those events.

---

### Challenge 2

Understanding what information should be passed through the Custom Event.

### Solution

Passed only the required `jobId` through the event `detail` instead of sending unnecessary information.

---

### Challenge 3

Understanding the difference between a user's Apply action and successful application submission.

### Solution

Learned that the `JobCard` only reports the Apply action. The parent component calls Apex to perform the application operation and determines whether it was successful or failed.

---

### Challenge 4

Testing the updated components after making the communication changes.

### Solution

Deployed the updated `EligibleJobs` and `JobCard` components to the Salesforce org and tested the View Details and Apply functionality successfully.
