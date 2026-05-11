# Eval-planning anti-pattern detectors

Four detectors, one per common failure mode. Each is a rule the skill can enforce: trigger condition, warning the SE puts in front of the sponsor, concrete remediation. The remediation is the actual move, not advice to think about it.

Run all four on every draft. A plan that fills in the six fields can still die quietly if a detector fires and the SE doesn't act on it.

## 1. Unaimed Evaluation — no business-decision sentence

**Trigger.** The plan does not contain a sentence naming the commercial action a specific decider will take if a specific outcome is true. Synonyms that do not count: "validate the approach," "demonstrate value," "prove the technology," "build the case."

**Warning.** *"This eval has no decision attached. It will produce results that everyone agrees are interesting and no one acts on."*

**Remediation.** In one sitting, ask the sponsor: *"What changes for the business based on what this eval shows? Who decides? When?"* Write the answer at the top of the plan in the sponsor's own words. If the sponsor can't answer all three parts, the eval is not ready to start — the gap is upstream, in discovery. Loop the AE in before drafting further. Do not begin execution against an unaimed plan.

> A POC without a business outcome attached is a well-measured failure.

## 2. Empty Chair — stakeholder list shows only one function

**Trigger.** Every named stakeholder reports up through the same organizational function — typically IT or identity. Security, risk, or compliance is absent. Or a single role is named "and team," with no individuals.

**Warning.** *"This eval is being approved by the audience that feels convenience; it will be vetoed by the audience that owns risk. Approval here does not predict purchase."*

**Remediation.** Name the missing audience explicitly to the sponsor: *"Before we kick off, who on the security side has to be comfortable for this to convert?"* If the sponsor resists — *"we don't need them involved yet"* — that resistance goes in the plan as a known political risk. Do not proceed without at least one named security or risk attendee at the wrap-up meeting. If the sponsor cannot produce one, the eval is testing the wrong thing.

A concrete sequencing move: when the eval design touches anything security-relevant — and most do — lead the demo with the threat model and the controls map. Bring UX in second. UX delights; risk decides.

> IT feels convenience; Security owns risk. Invite both — speak to risk first.

## 3. Sandboxed Proof — production deployment before kickoff

**Trigger.** The validation environment section names the customer's production environment as the test bed for an integration that hasn't been proven in a controlled mirror. Or the section is vague — *"we'll deploy into their environment"* — without specifying sandbox vs. production.

**Warning.** *"This eval will fail at the boundary between assumed network access and actual network access. The customer will see the failure as a product failure, not a setup failure."*

**Remediation.** Before kickoff, walk the customer's stack — identity provider, network controls, endpoint posture, security controls, the in-scope applications — and mirror it in a sandbox the SE prepares. The eval begins in that sandbox. The customer is invited to run their own tests there. Only after the sandbox produces clean results does anything touch the customer's production environment, and even then in stages. The hours spent on this are not setup tax; they are the planning.

A practical signal: if the SE cannot draw the customer's auth flow on a whiteboard from memory before the planning meeting, technical discovery isn't finished. Finish it before drafting the validation environment field.

> A demo in production confuses. A demo in our sandbox convinces.

## 4. Two-Week Flame — timeline too long, criteria list too fat

**Trigger.** Any of:

- Proposed timeline from kickoff to wrap-up exceeds three weeks.
- Binary criteria list has more than five entries.
- Scope grew during the planning meeting without anything coming off.
- The phrase *"let's just see how it goes"* was said in earnest.

**Warning.** *"This eval will exceed the customer's attention span. Champions will drift, the sponsor will lose visibility, the SE will spend the back half chasing calendars to make a business case no one remembers."*

**Remediation.** Cut to two weeks if possible, three at the outside. Reduce criteria to three. Move everything that doesn't directly resolve the business decision to a post-purchase rollout list — and *write that list*, so the customer can see their request hasn't been ignored, just sequenced. Book the wrap-up decision meeting at kickoff, with the decider attending. Run checkpoints every two to three days.

The point of the timebox is not speed for its own sake. The point is that an intense eval forces priority and ends in a decision, while a slow one breeds amnesia.

A specific phrase that protects this in the planning meeting, said once, calmly, in response to the first scope expansion:

> *"We've found that evals longer than two to three weeks lose momentum and end inconclusively — let's design this one to decide."*

> An intense POC forces priority and ends in a decision. A slow one breeds amnesia and leaves you chasing ghosts.
