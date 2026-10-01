# Codex Execution Plans

Use an ExecPlan for work that crosses package boundaries, changes public API contracts, introduces a state machine, adds hardware interaction, or is expected to require multiple implementation and test iterations.

An ExecPlan lives in `docs/plans/<short-name>.md` and is a living document. It must remain understandable without chat history.

Each plan must contain:

1. **Goal**: the user-visible or library-visible outcome.
2. **Scope**: what is included and explicitly excluded.
3. **Current state**: relevant files, APIs, invariants and known constraints.
4. **Design**: data flow, concurrency boundaries, state transitions and public API changes.
5. **Milestones**: small verifiable implementation steps.
6. **Validation**: exact unit, integration, simulator or hardware tests.
7. **Risks**: failure modes, compatibility concerns and rollback strategy.
8. **Progress**: dated checklist updated as work is completed.
9. **Decisions**: material design decisions and why they were made.

Do not create a plan for a trivial localized edit. When a plan exists, keep it synchronized with implementation rather than treating it as an upfront-only document.
