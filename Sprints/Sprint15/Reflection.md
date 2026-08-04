# Reflection – Sprint 15

Sprint 15 reinforced the importance of separating responsibilities in enterprise applications.

Instead of placing notification logic inside the Trigger, I delegated it to NotificationService. This design keeps the Trigger small, improves maintainability, and allows new communication methods such as email or SMS to be added later without changing the Trigger.
