# Reflection – Sprint 27

Sprint 27 helped me understand how Lightning Web Components communicate with each other. I learned how the `EligibleJobs` parent component passes job information to the `JobCard` child component and how the child communicates back using Custom Events.

I implemented `viewdetails` and `apply` events in the `JobCard` component and handled them in the `EligibleJobs` component. This helped me understand why a child should report an action instead of directly changing the parent's state.

I also learned the difference between a user's action and the final business outcome. For example, clicking Apply only indicates the user's intent, while the actual application result is determined after the Apex operation.

Overall, Sprint 27 improved my understanding of LWC component communication and helped me build a more structured and maintainable component architecture.
