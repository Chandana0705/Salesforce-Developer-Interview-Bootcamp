
# Learning Notes – Sprint 31

## Overview

Sprint 31 focused on integrating the major components of the Student Placement Portal and verifying the complete application workflow.

## Concepts Learned

- Learned how multiple Lightning Web Components can work together as one application.
- Understood the complete flow from Student Profile to Eligible Jobs and Applications.
- Learned how parent-child communication works using Custom Events.
- Understood how data can flow from parent components to child components.
- Learned how Lightning Data Service can be used for record operations.
- Understood the role of imperative Apex in application submission.
- Learned how server-side business validation protects application rules.
- Understood the importance of refreshing dependent data after a record update.
- Learned how loading, success, empty, and error states contribute to a better user experience.
- Understood how reusable components such as JobCard and EmptyState improve application structure.

## Key Takeaways

- A Salesforce application consists of multiple components with clear responsibilities.
- Components need appropriate communication mechanisms to work together.
- Salesforce data changes should be reflected in dependent components.
- Business rules should remain enforced on the server side.
- Duplicate application attempts should be handled by the application logic.
- Integration testing is important because individual components may work correctly but still fail when combined.
- A complete data flow is more important than treating each LWC as an isolated feature.
