# Reflection – Sprint 14

Sprint 14 introduced the concept of event-driven automation using Triggers.

I learned that a Trigger should only observe business events and delegate processing to a Service class. This keeps the Trigger clean and makes the application easier to maintain.

Separating statistics into a dedicated StatisticsService also makes it easier to extend the system with future reporting requirements, such as department-wise statistics or monthly placement reports.
