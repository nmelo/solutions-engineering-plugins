# Closed-lost detectors — persisting planning failures

Two detectors. Both translate eval-planning anti-patterns from a planning-time check into a readout-reading check: the planning failure is the loss reason, even when the readout records something else as the surface cause.

Run both on every learning agenda. Each fires when the readout shows a specific shape, and each has a warning the manager surfaces in plain language to the SE and AE before walking the readout.

A note on what isn't here: the other three eval-planning detectors — Sandboxed Proof, Two-Week Flame, and the Unasked Demo — do not translate to readout-reading without source. They tell the SE what to refuse at planning time; the post-hoc version (what does an attention-drift loss *look like in the readout?*) needs corpus material that isn't yet curated. The SKILL.md's Known Limitations section names these as v2 candidates. Don't pull them back in.

## 1. Unaimed Evaluation, persisting through to loss

**Trigger.** The readout's business-decision section is one of:

- Missing.
- Says "validate the approach," "demonstrate value," "prove the technology," or "build the case."
- Names a decision the customer is no longer positioned to make — the decider changed roles, the decision window passed, the budget cycle closed.

**Warning to the manager.** *"This loss is downstream of a planning failure, not a product failure. The eval was never designed to produce a decision; it produced ambiguity on schedule. The product can't lose what was never staked."*

**Remediation.** Surface this finding as the *primary* learning before anything else gets discussed. The capturable lesson is upstream of the eval, not inside it:

- The SE and AE should refuse evals that don't have a business decision attached.
- The remediation, if the team gets a second chance with a similar account shape, is to insert an explicit discovery step before drafting the Execution Plan, so the business decision is locked before kickoff.

Do not spend internal-review time on what the product did or didn't show. That isn't what the eval was testing. If the team tries to debate product performance under this detector's conditions, redirect — the conversation about product performance can happen separately, but it is not the learning this loss is offering.

> A POC without business outcomes is a well-measured failure.

## 2. Empty Chair, persisting through to loss

**Trigger.** The readout's stakeholder engagement record shows one of:

- All named attendees report up through the same organizational function — typically IT or identity.
- Security, risk, or compliance is absent from the engagement record entirely.
- The customer-facing readout meeting attendance list (Phase 5.2) shows no security or risk owner present.

**Warning to the manager.** *"This loss was approved by an audience that didn't have authority to convert. The product may be recorded as the loss reason, but the eval was never seen by the people who would have decided in favor of it. The audience composition is the actual loss reason."*

**Remediation.** The learning is in the planning step, not the execution step. The selling team missed the security-side audience during stakeholder construction in Stage 2. The capturable lessons:

- Rejected stakeholder additions during planning should appear *in the readout* as known political risk, not stay invisible. If a sponsor previously resisted bringing security in, that resistance is the loss cause and belongs in the record.
- Future evals with similar account shapes (IT-side sponsor, no security counterpart named) should treat the missing security audience as a halt condition during planning, not an open question to navigate during execution.

A concrete sequencing move for the next eval: when the design touches anything security-relevant — and most do — lead with the threat model and the controls map, and bring UX in second. UX delights; risk decides. The same move that prevents this failure at planning time is the one the team has just learned to enforce.

> IT feels convenience; Security owns risk.
