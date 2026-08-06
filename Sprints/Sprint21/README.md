# Engineering Sprint 21 – Batch Apex

## Objective

Process 120,000 historical Application records efficiently using Batch Apex.

---

## Business Requirement

Historical Application records need a new field called **Placement_Category__c**.

The category is calculated based on business rules without affecting user transactions.

---

## Why Batch Apex?

Processing thousands of records in one transaction may exceed Salesforce Governor Limits.

Batch Apex divides records into smaller batches and processes each batch independently.

---

## Batch Lifecycle

start()
↓
execute()
↓
finish()

---

## Batch Responsibilities

### start()

- Select records needing processing.
- Return QueryLocator.

---

### execute()

- Process one batch of records.
- Calculate Placement Category.
- Perform one bulk update.

---

### finish()

- Runs once after every batch completes.
- Can be used for logging or notifications.

---

## Files

- PlacementCategoryBatch.cls

---

## Execute Batch

```apex
Database.executeBatch(new PlacementCategoryBatch(),200);
```

---

## Learning Outcomes

- Implemented Batch Apex.
- Used start(), execute(), and finish().
- Processed records in manageable batches.
- Maintained bulk-safe code.
