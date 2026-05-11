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

### 1. Elicit the upstream conditions, then halt on gaps

The skill needs three answers locked in before drafting: (a) the specific deal outcome a successful eval will drive, (b) the named decision-maker who will drive it, (c) the date or business event the decision is feeding into. Run a two-beat structure — elicit answers from the SE first, then surface a targeted halt for whichever items come back fuzzy. Do not draft until the three items are concrete, or the SE has explicitly acknowledged the gap(s) and asked for a partial plan.

**How to elicit.** Use Claude's built-in `AskUserQuestion` tool. It presents 2-4 clickable options per question, automatically appends a free-text "Other" field, and accepts up to four questions in one call. Make a single call with three questions, one per upstream item. `multiSelect` stays off — each question wants one answer. Do not add an "Other" option manually; the tool provides it.

**Suggested question shape.** Concrete options should match the kind of eval the SE described — adapt them. The escape-hatch options are fixed and exist because honest gap-reporting is more useful than guessed answers.

| Question | Concrete options (illustrative — adapt to the eval) | Escape-hatch options |
|---|---|---|
| What specific deal outcome will a successful eval drive? | Sign a contract / master agreement · Fund a rollout / pilot expansion · Replace the incumbent | Sponsor hasn't named the deal outcome yet |
| Who is the named decision-maker — the person who will drive that outcome? | Project sponsor (verbally confirmed) · VP / exec sponsor above the project sponsor | Sponsor likely, not yet confirmed · Decision-maker above sponsor, unnamed |
| What date or business event anchors the decision? | Board review on [date] · Renewal cycle ending [date] · Budget close / Q-end planning | No hard date — eval is open-ended |

**Escape-hatches are gap signals, not approvals.** Selecting one identifies *which* upstream item is gapped; it does not let the SE skip the gate. If the SE picks "Other" and the free-text answer is itself fuzzy — any synonym of "validate the approach," "demonstrate value," "prove the technology," or "build the case" — treat that answer as an escape-hatch selection on that item. Fuzz on the deal-outcome answer is the Unaimed Evaluation trigger arriving early; do not let it through.

**Targeted halt messages.** For each gapped item, surface the corresponding halt verbatim. Multiple gaps → surface multiple halts. Do not summarize, do not soften.

- *Deal outcome gap:* "The eval needs a specific deal outcome before kickoff. Without one, the eval produces results everyone agrees are interesting and no one acts on. The discovery question to bring back to the sponsor and AE: *'What changes for the business if this eval lands — sign what, fund what, replace what?'* Get the answer in their words, not paraphrased. Loop back when you have it."

- *Decision-maker gap:* "The decision-maker isn't pinned. The eval can't safely begin without the named person who walks out of wrap-up with a signed action. The discovery question to bring to the AE: *'When the eval lands successfully, who specifically signs / funds / approves? Is that the sponsor, or does authority sit above them?'* Get them on the wrap-up calendar before kickoff. If authority kicks up, that's the upstream gap — surface it now, not later."

- *Date / business-event gap:* "The eval has no date anchor. Open-ended evals lose momentum, miss the window, and end without deciding anything. The discovery question to bring back to the sponsor: *'What business event is this decision feeding into — a board review, a renewal, a budget cycle, a compliance deadline? Is there a date for that event?'* If the answer is 'nothing specific,' the deal isn't being prioritized internally — that itself is the finding, and the AE should know."

**Partial-plan fallback.** After surfacing the targeted halt(s), the SE may want a working draft to iterate on while they close the gap offline. Honor that — but surface the gap first; never offer the partial as a way to skip the halt. The partial plan carries the gapped field(s) marked `[NEEDS: <gap statement>]` (the same convention used in Step 2). State at the top of the output that the plan is partial and not ready to walk into the planning meeting with. The Quality Checklist will flag the unfilled field on the way out — that flag is the point.

Only proceed to Step 2 when all three items are answered concretely, or when the SE has explicitly acknowledged the gap(s) and asked for the partial-plan fallback.

### 2. Draft the six fields

Fill each field against the user's situation. If material for a field is missing, mark it `[NEEDS: <what's missing>]` rather than inventing content.

- **Business decision** — one sentence, in the form: `If [observable outcome] is true at wrap-up, [named decision-maker] will [specific deal outcome] by [date].` Every other field exists to make this sentence resolvable.
- **Binary success criteria** — three to five pass/fail items. Each names a specific behavior under named conditions, runs against the customer's own data and environment, and resolves to true or false without interpretation. *"Improves auth speed"* is not a criterion. *"Completes the auth flow against the customer's top-five enterprise applications in their staging tenant with sub-second latency at the 95th percentile"* is.
- **Scope guardrails** — items explicitly out of scope, each with a one-line reason. Items the customer asked about during discovery that aren't on the path to the business decision go here, paired with where they go instead ("parked for post-purchase rollout," "covered in a separate workstream"). The SE walks in with this list already drafted; it makes scope creep harder.
- **Stakeholders** — every name has three attached items: role label (security, IT, identity, compliance, app owner, exec sponsor), stated interest (what they need the eval to show before they sign off), and the specific checkpoint or wrap-up they will be in the room for. `TBD` is not acceptable; flag the gap. The project sponsor stays on through wrap-up — confirmed verbally, not over email. The security or risk owner is named explicitly; their absence is the most common reason a technical win does not convert.
- **Validation environment** — integration surface (every named system the product will touch, by category and version), auth flow path (direction, credentials, boundaries), test data set (real users, test users, anonymized production, synthetic — be specific), and sandbox-vs-production posture. *"Their stack"* is not a description. Production is the second event, after the sandbox tests pass.
- **Timeline and checkpoints** — kickoff within one week of the planning meeting; wrap-up two to three weeks after kickoff, never longer, with the decision-maker attending; checkpoints every two to three days, not "as needed"; same-day internal recap with the AE.

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
If [observable outcome] is true at wrap-up, [named decision-maker] will [specific deal outcome] by [date].

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
| Decision-maker (exec sponsor) | [Name] | [Business decision above] | Wrap-up |
| [Other role] | [Name] | [Stated interest] | [Meetings] |

## Validation environment
- Integration surface: [named systems, categories, versions].
- Auth flow path: [direction, credentials, boundaries crossed].
- Test data: [real / test / anonymized / synthetic — named].
- Sandbox vs. production: sandbox first, prepared by the SE, mirroring the customer's stack. Production only after sandbox passes, in stages.

## Timeline
- Kickoff: [date, within one week of planning meeting].
- Checkpoint cadence: every 2–3 days.
- Wrap-up: [date, ≤3 weeks after kickoff], decision-maker attending.
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

- Business decision sentence is present and contains all four parts: observable outcome, decision-maker, deal outcome, date.
- If the plan carries any `[NEEDS: ...]` markers, the output explicitly states it is partial and not ready for the planning meeting. The gap statement matches the targeted halt the SE acknowledged in Step 1.
- Every success criterion is binary. No "improve," "demonstrate," "validate," "approach," or "evaluate" verbs.
- Success criteria list has 3–5 entries.
- Scope-out list is non-empty. An empty list is a Two-Week Flame trigger.
- Stakeholder table contains a named security or risk owner. If absent, the Empty Chair detector fires and its warning runs.
- Project sponsor commitment is verbal-confirmed, not "scheduled to confirm."
- Validation environment specifies sandbox vs. production explicitly.
- Timeline from kickoff to wrap-up is ≤3 weeks.
- Checkpoint cadence is ≤3 days.
- Wrap-up has the decision-maker on the calendar invite.
- All four detectors have run and their results are noted in the plan.
- No identifying customer names appear in the plan beyond the customer the SE is working with on this specific eval.

## Resources

- `references/anti-patterns.md` — the four detectors with trigger, warning, and remediation. Read in full before running Workflow step 3.
- `references/planning-meeting.md` — the 90-minute meeting structure plus the signal markers that distinguish a plan that will land from one that will die quietly. Read when preparing the agenda in Workflow step 4.
