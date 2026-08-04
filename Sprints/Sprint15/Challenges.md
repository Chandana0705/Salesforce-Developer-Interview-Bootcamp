# Challenges – Sprint 15

## Challenge 1

Understanding where notification logic should be placed.

### Solution

Created a dedicated NotificationService instead of writing notification code inside the Trigger.

---

## Challenge 2

Detecting when notifications should be sent.

### Solution

Compared Trigger.new with Trigger.oldMap and executed the service only when the Application Status changed.

---

## Challenge 3

Keeping the Trigger clean.

### Solution

Delegated all notification responsibilities to NotificationService.
