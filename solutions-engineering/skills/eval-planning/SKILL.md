---
name: eval-planning
description: >
  Drafts an evaluation plan for a customer POC or POV — business decision,
  binary success criteria, scope guardrails, stakeholders, validation
  environment, and timeline — co-created with the project sponsor in a single
  90-minute meeting, then pressure-tested against the four ways evals quietly
  fail. Use when scoping a POC, prepping an eval kickoff, drafting an
  evaluation brief, or sanity-checking a plan a sponsor sent over. Triggers on
  "draft an eval plan", "POV plan", "evaluation brief", "how should I scope
  this POC", "eval kickoff", "success criteria for this eval", or "POC scope".
---

# Eval-Planning

Produce a written evaluation plan for a customer POC or POV — the artifact the project sponsor signs onto before kickoff. The plan is six fields, co-created with the sponsor in a single 90-minute session, then pressure-tested against the four ways evals quietly fail. If the plan takes a second session to land, the planning failed. The deliverable here is something the SE can walk into the meeting with.

## When to Use

Fire on requests like:

- "Help me draft an eval plan for [account]." The SE is prepping the planning meeting and wants a strong starting point.
- "Sponsor sent over their version of the POV plan — can you sanity-check it?" Review pass against the six fields and the four detectors.
- "How should I scope this POC?" The user is upstream of planning; verify the business decision exists (see Workflow step 1) before drafting.

Do not fire for post-eval recaps, demo planning, or first-call discovery prep. Those are different skills.

## Workflow

Run these steps in order. Each can halt and ask the user a question; halting is the correct behavior when the upstream material isn't there.

### 1. Check the upstream conditions

Before drafting anything, confirm the user can name three things:

- The specific deal outcome a successful eval will drive — sign a contract, fund a rollout, replace the incumbent. Not "review results" or "consider next steps."
- The named person who will drive it.
- A date or business event that anchors the decision (a board review, a renewal, a budget cycle).

If any of the three is missing, halt. Tell the user: *"The eval isn't ready to plan yet — the gap is upstream, in discovery. Pin the business decision with the sponsor and AE before drafting further."* Offer to help frame the discovery question. Do not paper over the gap with a generic plan.

### 2. Draft the six fields

Fill each field against the user's situation. If material for a field is missing, mark it `[NEEDS: <what's missing>]` rather than inventing content.

- **Business decision** — one sentence, in the form: `If [observable outcome] is true at wrap-up, [named decider] will [specific deal outcome] by [date].` Every other field exists to make this sentence resolvable.
- **Binary success criteria** — three to five pass/fail items. Each names a specific behavior under named conditions, runs against the customer's own data and environment, and resolves to true or false without interpretation. *"Improves auth speed"* is not a criterion. *"Completes the auth flow against the customer's top-five enterprise applications in their staging tenant with sub-second latency at the 95th percentile"* is.
- **Scope guardrails** — items explicitly out of scope, each with a one-line reason. Items the customer asked about during discovery that aren't on the path to the business decision go here, paired with where they go instead ("parked for post-purchase rollout," "covered in a separate workstream"). The SE walks in with this list already drafted; it makes scope creep harder.
- **Stakeholders** — every name has three attached items: role label (security, IT, identity, compliance, app owner, exec sponsor), stated interest (what they need the eval to show before they sign off), and the specific checkpoint or wrap-up they will be in the room for. `TBD` is not acceptable; flag the gap. The project sponsor stays on through wrap-up — confirmed verbally, not over email. The security or risk owner is named explicitly; their absence is the most common reason a technical win does not convert.
- **Validation environment** — integration surface (every named system the product will touch, by category and version), auth flow path (direction, credentials, boundaries), test data set (real users, test users, anonymized production, synthetic — be specific), and sandbox-vs-production posture. *"Their stack"* is not a description. Production is the second event, after the sandbox tests pass.
- **Timeline and checkpoints** — kickoff within one week of the planning meeting; wrap-up two to three weeks after kickoff, never longer, with the decider attending; checkpoints every two to three days, not "as needed"; same-day internal recap with the AE.

### 3. Run the four detectors

Walk the draft against each detector in `references/anti-patterns.md` and surface any that fire. Each detector has a trigger condition, a warning to put in front of the user, and a concrete remediation — surface all three when a detector fires. Do not soften the warning text; the bluntness is the point. The detectors are:

- Unaimed Evaluation — the plan has no business-decision sentence.
- Empty Chair — the stakeholder list shows only one organizational function.
- Sandboxed Proof — non-trivial deployment goes straight to customer production.
- Two-Week Flame — timeline exceeds three weeks, or criteria exceed five.

### 4. Attach the planning-meeting agenda

The plan lands in the eval-management tool with the sponsor watching, inside a 90-minute working session with a specific shape. Pull the three-part agenda and the signal markers (what tells the SE the plan is going to land vs. die quietly) from `references/planning-meeting.md` and attach them to the plan output as a separate **Planning meeting** section. Don't paste the whole reference inline — summarize the agenda and pick the signal markers most likely to surface for this specific plan.

### 5. Emit the plan

Use the Output Format below. After the plan, write the Planning meeting section. Then run the Quality Checklist before delivering.

## Output Format

Produce the plan as a markdown block the SE can paste into the eval-management tool. Sections in this order:

```markdown
# Eval Plan — [Customer]

## Business decision
If [observable outcome] is true at wrap-up, [named decider] will [specific deal outcome] by [date].

## Binary success criteria
1. [Specific behavior, customer environment, measurable threshold.]
2. [...]
3. [...]
(Three to five total. More than five is a Two-Week Flame trigger.)

## Scope guardrails (out of scope)
- [Item] — [one-line reason it's excluded; where it goes instead].
- [Item] — [one-line reason].

## Stakeholders
| Role | Name | Stated interest | Committed to |
|---|---|---|---|
| Project sponsor | [Name] | [What they need to see] | Kickoff, all checkpoints, wrap-up |
| Security / risk owner | [Name] | [What they need to see] | Kickoff, wrap-up |
| Decider (exec sponsor) | [Name] | [Business decision above] | Wrap-up |
| [Other role] | [Name] | [Stated interest] | [Meetings] |

## Validation environment
- Integration surface: [named systems, categories, versions].
- Auth flow path: [direction, credentials, boundaries crossed].
- Test data: [real / test / anonymized / synthetic — named].
- Sandbox vs. production: sandbox first, prepared by the SE, mirroring the customer's stack. Production only after sandbox passes, in stages.

## Timeline
- Kickoff: [date, within one week of planning meeting].
- Checkpoint cadence: every 2–3 days.
- Wrap-up: [date, ≤3 weeks after kickoff], decider attending.
- Internal AE recap: same day as planning meeting.

## Detector check
- Unaimed Evaluation: [PASS / FAIL — note].
- Empty Chair: [PASS / FAIL — note].
- Sandboxed Proof: [PASS / FAIL — note].
- Two-Week Flame: [PASS / FAIL — note].
```

Then append:

```markdown
## Planning meeting
- **Who's in the room:** project sponsor + SE, AE supporting. Not the broader customer team — that comes back at kickoff.
- **Length:** 90 minutes minimum. Shorter is an agenda review, not a planning session.
- **Three parts:** (1) confirm success criteria (~30 min), (2) edit the plan live in the eval-management tool with the sponsor watching (~40 min), (3) schedule kickoff, checkpoints, and wrap-up with invites going out before the meeting ends (~20 min).
- **Signals to watch for:** [pull 2–3 markers from references/planning-meeting.md that match this specific plan — typically a mix of one "landing" signal and one "dying" signal to watch].
- **Same-day follow-ups:** AE recap; internal note that planning is complete. Customer does not get access to the plan in the eval-management tool until kickoff.
```

## Quality Checklist

Verify each item before delivering. If any fails, fix it or surface the gap to the user with a halt message — do not silently ship a plan with a hole.

- Business decision sentence is present and contains all four parts: observable outcome, decider, deal outcome, date.
- Every success criterion is binary. No "improve," "demonstrate," "validate," "approach," or "evaluate" verbs.
- Success criteria list has 3–5 entries.
- Scope-out list is non-empty. An empty list is a Two-Week Flame trigger.
- Stakeholder table contains a named security or risk owner. If absent, the Empty Chair detector fires and its warning runs.
- Project sponsor commitment is verbal-confirmed, not "scheduled to confirm."
- Validation environment specifies sandbox vs. production explicitly.
- Timeline from kickoff to wrap-up is ≤3 weeks.
- Checkpoint cadence is ≤3 days.
- Wrap-up has the decider on the calendar invite.
- All four detectors have run and their results are noted in the plan.
- No identifying customer names appear in the plan beyond the customer the SE is working with on this specific eval.

## Resources

- `references/anti-patterns.md` — the four detectors with trigger, warning, and remediation. Read in full before running Workflow step 3.
- `references/planning-meeting.md` — the 90-minute meeting structure plus the signal markers that distinguish a plan that will land from one that will die quietly. Read when preparing the agenda in Workflow step 4.
