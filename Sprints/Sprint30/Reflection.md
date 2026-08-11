# Reflection – Sprint 30

Sprint 30 helped me understand the importance of reusable components in Lightning Web Component development.

I created a reusable `EmptyState` component that accepts a title, message, and optional action label through `@api` properties. This allowed the component to be used inside the Eligible Jobs component without duplicating the empty-state markup.

Previously, the Eligible Jobs component displayed a simple message when no jobs were available. After implementing the reusable component, the application displays a clearer and more meaningful message to the student.

I also learned that component reuse should be based on meaningful functionality. Creating reusable components unnecessarily can increase complexity, while well-designed reusable components can reduce duplication and improve maintainability.

I deployed the changes and tested the empty-state scenario successfully. The application displayed **"No Eligible Jobs"** along with an appropriate explanation when no eligible opportunities were available.

Overall, Sprint 30 improved my understanding of reusable LWCs, `@api` properties, component design, and user-friendly empty states.
