# The planning meeting

The six fields are produced inside a single 90-minute working session with the project sponsor. The shape matters — without it, the fields end up half-filled and the SE leaves with homework instead of a plan.

## Who's in the room

Project sponsor and SE. AE attending in a supporting role. Not the broader customer team — that creates an audience the sponsor has to perform for, and slows decisions to consensus pace. If the AE has scheduled the meeting with the full team, ask for a separate session with the sponsor alone. The full team comes back at kickoff.

## How long

90 minutes, minimum. Anything shorter is an agenda review, not a planning session. If the sponsor pushes for 30, the eval is being deprioritized — surface that signal before drafting further.

## The three parts

| Time | Part | What happens |
|---|---|---|
| ~30 min | Confirm success criteria | Walk the draft criteria the SE arrived with. Pressure-test each: where's the risk if this passes anyway? What data feeds the pass/fail? Can this be tested in the time allocated? What would the sponsor read as *"this eval is going off the rails"* — name it, then build the early-warning into the checkpoint cadence. |
| ~40 min | Adjust the plan live, in the tool | The SE is editing the plan record while the sponsor watches. New criteria get typed in; scope items get cut; the timeline shifts as concrete date constraints surface. The deliverable from this part is a plan that exists, in writing, with both parties having watched it being written. The phrase *"let me send you a draft to review"* is the failure mode this part prevents. |
| ~20 min | Schedule kickoff, checkpoints, wrap-up | Calendar app open. Invites going out. Attendees confirmed. The wrap-up invite goes out with the decision-maker on it. If the decision-maker's calendar conflicts, that's surfaced now, not later. If the sponsor offers to *"send the invites afterward,"* offer to do it together right now — and note any resistance. |

## After the meeting

Two same-day follow-ups:

- **AE recap.** Make sure the AE is aligned with the plan that was just agreed to. Context decays fast; same-day or it doesn't happen.
- **Internal note.** Brief announcement in the customer's internal channel that planning is complete.

One operational detail: the customer's broader team does not get access to the plan in the eval-management tool until kickoff. Sharing it earlier invites the sponsor's colleagues to redesign it before the SE can walk them through the reasoning live.

## Signal markers — is this plan going to land?

A plan that fills in the six fields can still be a plan that dies quietly. The markers below distinguish the two. They are observable inside the planning meeting, not inferred later. Watch for them in real time and adjust before the meeting ends.

### Markers the plan is going to land

- The sponsor uses *"we"* — *"when we test the auth flow," "when we wrap up"* — not *"you."* Ownership has transferred.
- The sponsor can restate the binary success criteria back to the SE in their own words, without reading from the screen.
- The sponsor names a specific business event the answer is tied to — a board review, a renewal date, a budget cycle, a compliance deadline. The eval is on the critical path of something else.
- The sponsor edits the plan during the meeting. Not just nods. Adds a criterion, narrows a scope item, names a person.
- The sponsor's calendar is already partially blocked for the eval window before the meeting ends.
- The sponsor names a security or risk counterpart and offers to bring them in, without being pushed.

### Markers the plan is about to die quietly

- *"Let's figure out success criteria as we go."* The plan has not been written; an agenda has been written.
- The sponsor delegates planning to a technical lead and stops attending. The eval has lost its decision-maker, or its line to one.
- The proposed timeline keeps stretching during the meeting. Six weeks is the universal sign of a sponsor who isn't protecting attention.
- *"Let's reconvene next week to schedule the checkpoints."* The checkpoints will not be scheduled.
- The scope list grows monotonically through the meeting. Nothing comes off.
- The sponsor says *"and we should also probably look at"* more than twice. Each instance is a future scope battle.
- The SE finds themselves explaining the product mid-meeting. Discovery was incomplete; the planning meeting is being used to finish it.

A plan can have all six fields filled in and still be a dying plan. The fields are necessary. The markers are how the SE knows they were filled in honestly.

## Phrases that do work in the meeting

A few lines that hold their weight, said once and not repeated:

- On scope creep: *"We are the experts on what this product can prove in two weeks."*
- On scheduling: *"Let's get these on the calendar now so we don't have to chase them later."*
- On timeline: *"We've found that evals longer than two to three weeks lose momentum and end inconclusively — let's design this one to decide."*
- On the security audience: *"Before we kick off, who on the security side has to be comfortable for this to convert?"*

Each of these is a small assertion of authority that costs nothing if the sponsor is already aligned, and saves the eval if they aren't.
