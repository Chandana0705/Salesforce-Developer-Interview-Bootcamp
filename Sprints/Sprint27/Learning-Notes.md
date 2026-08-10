# Learning Notes – Sprint 27

## Overview

Sprint 27 focused on communication between Lightning Web Components (LWCs) in the Student Placement Portal by connecting the `JobCard` child component with the `EligibleJobs` parent component.

## Concepts Learned

- Learned how parent and child LWCs communicate with each other.
- Understood how to pass information from parent to child using `@api`.
- Learned how to use Custom Events for child-to-parent communication.
- Understood how the `JobCard` component can send events such as `viewdetails` and `apply`.
- Learned how the parent component receives and handles these events.
- Understood the difference between user intent and the actual business outcome.
- Learned that the child component should report an action while the parent coordinates the required behaviour.

## Key Takeaways

- `@api` is used for parent-to-child communication.
- Custom Events are used for child-to-parent communication.
- Child components should not directly modify parent state.
- Components should have clear responsibilities.
- Sprint 27 helped improve the communication and architecture of the Student Placement Portal.
