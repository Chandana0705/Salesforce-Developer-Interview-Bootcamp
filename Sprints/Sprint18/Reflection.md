# Reflection – Sprint 18

Sprint 18 focused on designing a bulk-safe solution for detecting when an Application status changes to Selected.

I learned how Trigger.oldMap and Trigger.new work together to identify field changes. Instead of processing records individually, I collected Student IDs using a Set, queried all required Student records in a single SOQL query, updated them in memory, and saved them using one DML statement.

This sprint also reinforced Salesforce best practices such as keeping Triggers lightweight, moving business logic into Service classes, and designing applications that scale efficiently while respecting Governor Limits.

Overall, Sprint 18 improved my understanding of enterprise Apex architecture and bulk processing techniques.
