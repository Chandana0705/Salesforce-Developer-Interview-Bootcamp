# Challenges – Sprint 30

## Challenges Faced

### Challenge 1

The Eligible Jobs component previously displayed a simple message when no eligible jobs were available.

### Solution

Created a reusable `EmptyState` component to provide a more meaningful and user-friendly empty-state message.

---

### Challenge 2

Making the Empty State component reusable for different situations.

### Solution

Used `@api` properties for the title, message, and optional action label so that different parent components can provide their own values.

---

### Challenge 3

Integrating the reusable Empty State component with the existing Eligible Jobs component.

### Solution

Replaced the existing plain empty message in `EligibleJobs` with the `<c-empty-state>` component.

---

### Challenge 4

Testing the component when there are no eligible jobs.

### Solution

Tested the Eligible Jobs component with no eligible records and verified that the reusable Empty State displayed the expected title and message successfully.

---

### Challenge 5

Understanding when component reuse is appropriate.

### Solution

Learned that reusable components should represent meaningful UI or business behaviour and should not be created unnecessarily.
