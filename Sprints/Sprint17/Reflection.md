# Reflection – Sprint 17

Sprint 17 introduced the concept of bulk-safe Apex programming.

Instead of validating one application at a time, I redesigned the service to process multiple applications together. I used Sets to collect unique record IDs, queried related records only once, and stored them in Maps for efficient access.

This sprint helped me understand why Salesforce developers avoid SOQL and DML inside loops and how bulkification improves application performance, scalability, and maintainability.
