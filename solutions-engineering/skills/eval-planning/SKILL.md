---
name: eval-planning
description: >
  Drafts an evaluation plan for a customer POC or POV — business decision,
  binary success criteria, scope guardrails, stakeholders, validation
  environment, and timeline — co-created with the project sponsor in a single
  90-minute meeting, then pressure-tested against the four ways evals quietly
  fail. Use when scoping a POC, preparing for an eval kickoff, drafting an
  evaluation brief, or sanity-checking a plan a sponsor sent over. Triggers on
  "draft an eval plan", "POV plan", "evaluation brief", "how should I scope
  this POC", "eval kickoff", "success criteria for this eval", or "POC scope".
---

# Eval-Planning

Produce a written evaluation plan for a customer POC or POV — the artifact the project sponsor signs onto before kickoff. The plan is six fields, co-created with the sponsor in a single 90-minute session, then pressure-tested against the four ways evals quietly fail. If the plan takes a second session to land, the planning failed. The deliverable here is something the SE can walk into the meeting with.

## When to Use

Fire on requests like:

- "Help me draft an eval plan for [account]." The SE is preparing for the planning meeting and wants a strong starting point.
- "Sponsor sent over their version of the POV plan — can you sanity-check it?" Review pass against the six fields and the four detectors.
- "How should I scope this POC?" The user is upstream of planning; verify the business decision exists (see Workflow step 1) before drafting.

Do not fire for post-eval recaps, demo planning, or first-call discovery prep. Those are different skills.

## Workflow

Run these steps in order. Each can halt and ask the user a question; halting is the correct behavior when the upstream material isn't there.

### 1. Open the session, then run the upstream questionnaire

Open with a holistic 4-beat paragraph — the SE walking in deserves a teammate's acknowledgment before any structured tool fires. Then run the upstream questionnaire as described below.

**The 4-beat opening.** The four beats are scaffolding for *how to think about* the opener; the SE sees three short paragraphs — situation acknowledgment, outcome, and contract + ready transition — with visible whitespace between them, no labels, no numbers. The four beats are:

1. **Situation acknowledgment.** Name what the SE is doing right now, in their voice. Adapts to context.
2. **Brief outcome.** One sentence — what the SE walks away with.
3. **The contract.** One sentence — what the SE contributes + time estimate.
4. **Ready check with transition.** Yes/no consent moment connected to the first concrete move.

**Two contexts for Beat 1 (and Beat 4's transition).** Read the trigger phrasing and the SE's first message together; pick the variant that fits.

- **Planning-meeting prep** — the SE is drafting a plan before the planning meeting with a sponsor. Triggers: *"draft an eval plan," "POV plan," "eval kickoff," "POC scope," "how should I scope this POC," "success criteria for this eval."*
- **Sanity-check on a sponsor draft** — the SE has a draft and wants it pressure-tested. Triggers: *"sanity-check this plan,"* *"evaluation brief"* phrased as a review request, or any phrasing that mentions an existing draft.

If context is ambiguous, lean toward planning-meeting prep — it's the more common case.

**Illustrative full paragraphs.** Adapt language to the SE's actual phrasing but match the shape and register. Emit as one paragraph; do not label the beats in the output.

*For planning-meeting prep:*

> OK, eval planning — you're preparing for the meeting where you and the sponsor co-create the plan live. Let me help you walk in with a strong starting position.
>
> By the end you'll have your eval plan drafted — the business decision, success criteria, scope in and out, named stakeholders, validation environment, and a timeline with checkpoints. Plus the agenda for the planning meeting itself. All paste-ready.
>
> I'll ask short questions as we go; runs about 10–15 minutes. Sound good? Let's start with where you are with the sponsor.

*For sanity-check on a sponsor draft:*

> Got it, sanity-check pass on a draft your sponsor sent over. Let me work through it with you against where evals quietly go off the rails.
>
> By the end you'll have your eval plan — the business decision, success criteria, scope in and out, named stakeholders, validation environment, and a timeline with checkpoints. Plus the agenda for the planning meeting itself. All paste-ready.
>
> I'll ask short questions as we go; runs about 10–15 minutes. Sound good? Let's start by checking what the draft says on the three things every eval has to answer.

Wait for the SE's acknowledgment of the ready check before running the AskUserQuestion below.

The skill needs three answers locked in before drafting: (a) the specific deal outcome a successful eval will drive, (b) the named decision-maker who will drive it, (c) the date or business event the decision is feeding into. Run a two-beat structure — elicit answers from the SE first, then surface a targeted halt for whichever items come back fuzzy. Do not draft until the three items are concrete, or the SE has explicitly acknowledged the gap(s) and asked for a partial plan.

**Say to the SE before the call.** Emit this preamble verbatim before firing the AskUserQuestion tool:

> *Three questions before we draft anything. Without these locked, even a passed eval ends with "interesting results, let's talk again" — they thread through every field that follows.*

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

**Thread-specifics — two prose questions before per-field drafting.** When all three upstream answers come back concrete, emit:

> *Before we start drafting, two specifics that'll thread through the whole plan.*

Then ask the SE in prose:

- **Q-end specificity — conditional.** Only ask if the anchor-date answer was "Budget close / Q-end planning" or otherwise Q-end-flavored without a specific date. Phrasing: *"Which Q-end? Budget close / Q-end planning could be this quarter or next. Give me the specific budget-close or Q-end date the exec sponsor is feeding this decision into."* If the SE already provided a specific date in the upstream answer, skip this question.
- **Customer name — always ask.** Phrasing: *"Customer name for the plan header (so the artifact is paste-ready when we finish)."*

Both answers come from the SE in plain prose — no AskUserQuestion needed. Once in hand, substitute the customer name into subsequent user-facing prose (replacing any `[customer]` placeholder) and resolve the anchor date to the specific Q-end date in the business-decision sentence.

### 2. Draft the six fields, one consultative beat at a time

Step 2 runs as six consultative beats — one per field. Each beat self-assesses which mode to run in: **propose-and-iterate** (skill drafts directly from accumulated context, SE iterates) or **ask-then-draft** (skill asks via AskUserQuestion first, then drafts from the answer). The structured option sets for ask-then-draft beats live in `references/per-field-questions.md`.

**Self-assessment per beat.** Before each per-field beat, Claude assesses whether accumulated context (upstream answers + thread-specifics + the SE's trigger phrasing + deal shape from their first message) provides enough signal to propose a strong first draft directly.

Routes to **propose-and-iterate** when:
- The deal shape (industry vertical, eval type, customer-side capabilities) makes the field's content largely inferable.
- Upstream answers already supply most of what the field needs.
- The field's content is highly stereotyped for this kind of eval.

Routes to **ask-then-draft** when:
- Field content depends on org-specific knowledge Claude doesn't have (which stakeholders are engaged, customer's environment posture).
- The SE has a small set of orthogonal choices to make (sandbox vs. production, three vs. four weeks).
- Failure mode of guessing wrong is high (e.g., inventing a stakeholder name).

The mode mapping below is the lock for the eval-planning skill. Future skills with additional beats apply the same self-assessment logic:

| Beat | Mode | Routing rationale |
|---|---|---|
| 2.1 Business decision | Propose-and-iterate | Upstream + thread-specifics give 3 of 4 if-then parts; deal shape gives the IF clause. |
| 2.2 Binary success criteria | Propose-and-iterate | Deal shape narrows the criteria space to 2–3 stereotyped picks for this eval type. |
| 2.3 Scope guardrails | Ask-then-draft | Common discovery items vary by industry vertical and eval type; SE picks from candidates. |
| 2.4 Stakeholders | Ask-then-draft | Customer's org chart is opaque to skill. |
| 2.5 Validation environment | Ask-then-draft | Sandbox vs. production posture is an SE+customer joint decision. |
| 2.6 Timeline and checkpoints | Ask-then-draft | Four timeline shapes; SE picks which fits the eval. |

Across Step 2: four AskUserQuestion calls total (beats 2.3–2.6), plus the upstream intake from Step 1 = five AskUserQuestion calls across the whole skill.

**Beat structure varies by mode:**

- **Propose-and-iterate**: field intro (which incorporates the explanation bridge naming context-derived defaults) → draft → confirm.
- **Ask-then-draft**: field intro → AskUserQuestion preamble (≤2 sentences immediately before the tool call — TUI clip constraint, see Step 1) → AskUserQuestion call → detector pre-fire (if triggered) → explanation bridge → draft → confirm.

**Full re-emit on iteration.** When the SE asks to change part of a drafted multi-element field (criteria, scope items, stakeholders, validation environment sub-items, timeline elements), the skill re-emits the full updated state of that field as a block-quote — not just the changed item. Diff-only emit treats the skill as a patcher; full re-emit treats it as a co-drafter and lets the SE check the items still hang together as a group. Single-sentence fields (business decision) trivially satisfy this since the iteration is the full re-emit.

Each beat applies its mode's structure below.

#### 2.1 Business decision

**Mode.** Propose-and-iterate. Upstream + thread-specifics give the decision-maker, the deal outcome, and the anchor date; deal shape (industry vertical, eval type, customer-side capabilities) gives the fourth part — the observable outcome at wrap-up.

**Field intro + explanation bridge (user-facing).** Emit at the start of the beat, immediately after thread-specifics resolve. This text carries both the bridge (framing the propose-and-iterate move) and the field intro (naming what's non-obvious about the business decision):

> *Got it. Now I'll fold those three answers into one sentence — the business decision. It's the spine of the plan; every other field below exists to make this sentence true or false at wrap-up. The form: If [observable outcome] is true at wrap-up, [decision-maker] will [specific deal outcome] by [date]. Drafting:*

**Draft.** Apply the if-then template. The IF clause comes from inferring the observable outcome from the deal shape — e.g., for an FSI workforce-auth eval with security-led board readout, the IF clause is "passwordless authentication is verified working against [customer]'s top-five enterprise applications and clears security review against the board-readout criteria." Substitute the customer name (from thread-specifics), the decision-maker (from upstream), the deal outcome (from upstream), and the anchor date (from thread-specifics) into the template. Emit as a single block-quoted sentence.

**Anti-pattern halt.** If the deal shape contains fuzzy verbs as the success criterion ("demonstrate value," "validate the approach," "prove the technology," "build the case") and Claude has no concrete observable to anchor the IF clause to, treat as the Unaimed Evaluation trigger arriving inside Step 2: surface the deal-outcome targeted halt from Step 1 and offer to mark the field `[NEEDS: <gap>]`.

**Confirm.** Surface the drafted sentence and ask in prose: *"Sound right, or want to adjust before we move to success criteria?"* If the SE confirms, lock the field and proceed to 2.2. If they want a tightening, emit the full updated sentence as a block-quote (single-sentence fields trivially satisfy the full re-emit requirement), then re-ask. After two non-converging iterations, halt and surface the gap — the field has more upstream work than Step 2 can resolve in this session. The confirm beat is not skippable; do not proceed to 2.2 without an explicit confirmation or an acknowledged NEEDS mark.

#### 2.2 Binary success criteria

**Mode.** Propose-and-iterate. Deal shape narrows the criteria space to 2–3 stereotyped picks for this eval type; skill drafts three by default, SE adjusts via confirm.

**Field intro + explanation bridge (user-facing).** Emit at the start of the beat, after 2.1's confirm clears. The field intro names what binary criteria require; the bridge names the context-derived defaults:

> *Success criteria next. The binary pass/fail items — three to five — you'll run against [customer]'s own data and environment to decide if the eval succeeds. Each needs a specific behavior under named conditions and a measurable threshold that resolves to true or false without interpretation.*
>
> *From the deal shape — [2–3 deal characteristics that anchor the criteria choices, e.g., "passwordless workforce auth at an FSI prospect, security-led board readout as the anchor"] — three earn their place by default:*

**Draft.** Generate three binary criteria from deal shape. Each criterion names a specific behavior under named customer-environment conditions and a measurable threshold. Use concrete verbs (*completes, rejects, achieves, returns, resolves*) — never fuzzy verbs (*demonstrates, validates, approaches, evaluates, improves*). Emit as a block-quoted numbered list of three.

**Confirm.** Ask in prose: *"Any of these wrong for this deal? Want to swap one out, add a fourth, drop to two?"* If the SE wants a change, emit the full updated list of criteria as a block-quote (full re-emit, not just the changed item), then re-ask. Two-iteration safety valve.

**Edge cases.**
- If the SE proposes more than five total, name the Two-Week Flame trigger explicitly and ask which two should move to post-purchase rollout.
- If the SE accepts fewer than three after iteration, mark `[NEEDS: criterion 2]` (or 3) rather than padding.
- If an SE-proposed criterion uses fuzzy verbs ("demonstrate auth," "validate the approach"), surface the fuzzy-verb anti-pattern in prose and ask for a concrete behavior + measurable threshold.

#### 2.3 Scope guardrails

**Mode.** Ask-then-draft. Common discovery items vary by industry vertical and eval type; skill offers candidates, SE picks which ones go on the out-of-scope list.

**Field intro (user-facing, 3–4 sentences).** Emit at the start of the beat, after 2.2's confirm clears:

> *Scope guardrails next. The out-of-scope list — items the customer asked about during discovery that aren't on the path to the deal outcome, each paired with a one-line reason and where it goes instead (post-purchase rollout, separate workstream). The list does most of its work in the planning meeting: when the sponsor pushes for new scope mid-meeting, the reason is what holds the line. Walking in with this drafted gives you a strong point of view that's hard to dictate against.*

**AskUserQuestion preamble (≤2 sentences immediately before the call).** Emit:

> *Common candidates for [deal-shape-matched] POCs:*

**Ask.** Read §2.3 of `references/per-field-questions.md`. Make the AskUserQuestion call with `multiSelect: false`. Note: the SE may also free-text additional out-of-scope items via the automatic "Other" field, or flag one item as in-scope-by-exception.

**Explanation bridge after SE answers (1–2 sentences).** Emit:

> *Got it. I'll draft these as the out-of-scope list, each with a one-line reason and where it goes instead. The reasons matter: at the planning meeting, when the sponsor pushes a new request, the reason is what holds the line.*

**Draft.** Emit the SE's picks as a block-quoted bullet list. Each bullet has: item — one-line reason — where it goes instead ("post-purchase rollout workstream," "separate eval cycle," "Phase 2"). If the SE flagged any item as in-scope-by-exception, add it at the bottom as `[In-scope by exception]` with the sponsor's discovery rationale.

**NEEDS path.** If the SE can't enumerate out-of-scope items because the in-scope picture isn't pinned (e.g., *"sponsor hasn't said what's in, can't say what's out"*), the field carries `[NEEDS: scope boundaries from sponsor]` rather than an empty list — the gap is upstream, not in the SE's drafting. Empty out-of-scope lists where the SE chose not to park anything are a different state: a Two-Week Flame trigger — surface that warning before locking the field.

**Confirm.** Ask in prose: *"Does this cover what the sponsor asked about that doesn't belong in this eval? Anything missing or mis-categorized?"* If the SE wants a change, emit the full updated list as a block-quote (full re-emit), then re-ask. Two-iteration safety valve. Lock the field and proceed to 2.4 on confirmation.

#### 2.4 Stakeholders

**Mode.** Ask-then-draft. Customer's org chart is opaque to skill without asking.

**Field intro (user-facing, 3–4 sentences).** Emit at the start of the beat, after 2.3's confirm clears:

> *Stakeholders next. Every name on this list needs three attached items: their role label (security, IT, identity, compliance, app owner, exec sponsor), their stated interest (what they need the eval to show before they sign off), and the committed meeting (kickoff/checkpoint/wrap-up they'll be in the room for, on the calendar, accepted). The most common reason a technical win doesn't convert is a missing security or risk owner on this list — IT feels convenience, security owns risk, both need to be there.*

**AskUserQuestion preamble (≤2 sentences immediately before the call).** Emit:

> *Who's in the room for this eval — pick all that apply:*

**Ask.** Read §2.4 of `references/per-field-questions.md`. Make the AskUserQuestion call with the multiSelect setting per the references file (multi-pick is natural here since several roles can be engaged simultaneously).

**Detector pre-fire (Empty Chair).** If the SE's picks roll up through one organizational function (typically IT-only — Project sponsor + App owners but no Security / risk owner), Empty Chair is pre-triggering. Before drafting the stakeholder table, surface the warning in-beat:

> *⚠ One thing to flag before we draft the stakeholder list.*
>
> > *"This eval is being approved by the audience that feels convenience; it will be vetoed by the audience that owns risk. Approval here does not predict purchase."*
>
> *Your stakeholder list rolls up through IT operations. Security has equities in the board review at the anchor date — they will weigh in on whether the eval result is acceptable, whether or not they're in the room today. If you walk into the planning meeting without a named security counterpart, the sponsor may resist naming one ("we don't need them involved yet") — that resistance goes in the plan as a known political risk.*
>
> *The move before the planning meeting: ask the sponsor, in their words, "Before we kick off, who on the security side has to be comfortable for this to convert?" If they can produce a name, the eval has a real chance. If they can't, the eval is testing the wrong thing.*

Then ask the SE: *"I'll draft the stakeholder table with security/risk marked as a gap to close. Want me to also draft the sponsor-facing ask you'd take to your next touch?"*

If the SE accepts, draft both the table and the sponsor-facing ask. If the SE can name a security/risk counterpart on the spot, add them to the draft list and skip the sponsor-facing ask.

If Empty Chair did not pre-fire (security/risk was picked or the engagement spans multiple functions), skip the warning block and proceed directly to the explanation bridge below.

**Explanation bridge.** Emit:

> *Got it. Drafting the stakeholder table with role, stated interest, and committed meeting per named contact.*

**Draft.** Emit the stakeholder table as a block-quoted markdown table with four columns: Role | Name | Stated interest | Committed to. Each row has all four cells filled or marked with explicit gap notation. Any role that fired the Empty Chair detector goes in the table with `**NEEDS: name from sponsor by planning meeting**` in the Name cell; the warning rides into Step 3 (structural detector check) too — defense in depth. If the SE accepted the sponsor-facing ask, emit it after the table as a block-quoted italicized paragraph.

**Confirm.** Ask in prose: *"Each role has a named person, a stated interest, and a meeting they're committed to. Anyone missing or any `TBD` we need to close before kickoff?"* If the SE wants a change, emit the full updated table as a block-quote (full re-emit), then re-ask. Two-iteration safety valve. Lock the field and proceed to 2.5.

#### 2.5 Validation environment

**Mode.** Ask-then-draft. Sandbox vs. production posture is an SE+customer joint decision.

**Field intro (user-facing, 2–3 sentences).** Emit at the start of the beat, after 2.4's confirm clears:

> *Validation environment next. The technical description of the test bed — integration surface (named systems and versions), auth flow path (direction and boundaries), test data (real / test / anonymized / synthetic), and sandbox-vs-production posture. The discipline here: "their stack" is not a description, and a kickoff that hand-waves the environment produces "it works in our lab" meeting "in ours, it does not."*

**AskUserQuestion preamble (≤2 sentences immediately before the call).** Emit:

> *Which approach are we taking?*

**Ask.** Read §2.5 of `references/per-field-questions.md`. Make the AskUserQuestion call with `multiSelect: false`.

**Detector pre-fire (Sandboxed Proof).** If the SE picked the production-first option or any Other answer that names the customer's production as the primary test bed without a sandbox proof first, Sandboxed Proof is pre-triggering. Surface its warning from `references/anti-patterns.md` §3 in-beat before drafting; note the warning rides into the field itself.

**Explanation bridge.** Emit (adapt to the picked option — example for sandbox-first):

> *Sandbox-first locks in — that's the Sandboxed Proof discipline; the eval runs in your mirror of [customer]'s stack before anything touches their production. I'll draft the four sub-items now, marking any specifics you don't have yet as NEEDS:*

**Draft.** Emit the four sub-items (integration surface, auth flow path, test data, sandbox/prod posture) as a block-quoted bullet list. For each sub-item the SE hasn't specified, ask one prose follow-up ("Which identity provider? Which app set? Real users or synthetic?") and incorporate the answer. Any specifics still unanswered carry `[NEEDS: <specific piece>]`.

**Operational test (post-draft, before confirm).** Surface one line: *"One operational test before the planning meeting — if you can't draw [customer]'s auth flow on a whiteboard from memory, technical discovery isn't finished. Finish it before walking in with this section."*

**Confirm.** Ask in prose: *"Does this match the environment we'll actually be testing in? Anything in the integration surface or auth flow that's still loose?"* If the SE wants a change, emit the full updated field as a block-quote (full re-emit of all four sub-items), then re-ask. Two-iteration safety valve. Lock the field and proceed to 2.6.

#### 2.6 Timeline and checkpoints

**Mode.** Ask-then-draft. Four timeline shapes; SE picks which fits the eval.

**Field intro (user-facing, 3–4 sentences).** Emit at the start of the beat, after 2.5's confirm clears:

> *Timeline next.*
>
> *Kickoff, checkpoints, wrap-up — each pinned in a real calendar invite before the planning meeting ends, not "scheduled later." The constraints: kickoff within a week of planning, wrap-up at most three weeks after, checkpoints every two-to-three days, decision-maker on the wrap-up invite. An intense eval forces priority and ends in a decision; a slow one breeds amnesia and leaves the sponsor chasing ghosts.*

**AskUserQuestion preamble (≤2 sentences immediately before the call).** Emit:

> *AE pressure on this one is real. What shape do you want to plan for?*

**Ask.** Read §2.6 of `references/per-field-questions.md`. Make the AskUserQuestion call with `multiSelect: false`.

**Detector pre-fire (Two-Week Flame).** If the SE picked the four-weeks option or longer, Two-Week Flame is pre-triggering. Surface its warning and remediation from `references/anti-patterns.md` §4 in-beat before drafting any dates; ask which scope items can move to a post-purchase rollout list to cut the timeline. If the SE picked open-ended, the Step 1 date-anchor halt re-surfaces here — Step 2 is not the place to drift past a Step 1 gap.

**Explanation bridge.** Emit (adapt to picked option — example for three-weeks):

> *[Picked timeline shape, e.g., "Three weeks"] — within the safe range. I'll pin kickoff, the checkpoint cadence, the wrap-up with the exec sponsor on the invite, and the same-day AE recap. Then surface two phrases you'll need to bring into the planning meeting verbatim.*

**Draft.** Emit the timeline as a block-quoted bullet list (kickoff date, checkpoint cadence with named days where possible, wrap-up date with decision-maker attending, same-day AE recap). If specific dates are still fuzzy beyond the Step 1 anchor (e.g., *"wrap-up date depends on procurement, no fixed date yet"*), draft with placeholder dates relative to the anchor and mark the unfilled specifics — for example, `[NEEDS: procurement-dependent wrap-up date]`.

Then emit the two protective phrases for the planning meeting. Each as a block-quoted italicized sentence with one sentence of context:

- The timeline-protection phrase: *"We've found that evals longer than two to three weeks lose momentum and end inconclusively — let's design this one to decide."* Said once, calmly, in response to the first scope expansion or timeline stretch.
- The scheduling-in-the-room phrase: *"Let's get these on the calendar now so we don't have to chase them later."* If the sponsor offers to send invites afterward, offer to do it together right now. Resistance to scheduling-in-the-room is itself a signal.

**Confirm.** Ask in prose: *"Kickoff date, checkpoint cadence, wrap-up date with decision-maker, AE recap same day. Anything stretching past three weeks, or any date that needs a calendar check before we run detectors?"* If the SE wants a change, emit the full updated timeline as a block-quote (full re-emit, including the protective phrases), then re-ask. Two-iteration safety valve. Once locked, proceed to Step 3 — run the four detectors against the completed draft.

### 3. Run the four detectors

Walk the draft against each detector in `references/anti-patterns.md` and surface any that fire. Each detector has a trigger condition, a warning to put in front of the user, and a concrete remediation — surface all three when a detector fires. Do not soften the warning text; the bluntness is the point. The detectors are:

- Unaimed Evaluation — the plan has no business-decision sentence.
- Empty Chair — the stakeholder list shows only one organizational function.
- Sandboxed Proof — non-trivial deployment goes straight to customer production.
- Two-Week Flame — timeline exceeds three weeks, or criteria exceed five.

### 4. Attach the planning-meeting agenda

The plan lands in the eval-management tool with the sponsor watching, inside a 90-minute working session with a specific shape. Pull the three-part agenda and the signal markers (what tells the SE the plan is going to land vs. die quietly) from `references/planning-meeting.md` and attach them to the plan output as a separate **Planning meeting** section. Don't paste the whole reference inline — summarize the agenda and pick the signal markers most likely to surface for this specific plan.

### 5. Emit the plan

Use the Output Format below. After the plan, write the Planning meeting section. Then run the Quality Checklist before delivering. Once the markdown plan emits and the SE confirms, proceed to Step 6 — the PDF render offer.

### 6. Offer the PDF render

After the markdown plan emits and the SE has confirmed, the skill offers a polished PDF render via Typst. The PDF is an additional artifact — the markdown above stays paste-ready regardless.

**Check typst availability first.** Run `command -v typst` via Bash. Branch on the result:

- **If typst is installed** (command returns a path, exit 0): emit the offer (text below).
- **If typst is absent** (command returns nothing, exit 1): do not emit the render offer. Instead, append one short line to the conversation, after the markdown plan: *"PDF render via Typst is available if you install typst — see [typst.app](https://typst.app) for install instructions."* The skill is complete; the markdown plan stands on its own.

**If typst is available, emit the offer:**

> *Want a PDF version too? I can render this via Typst — useful if you need to share the plan with someone outside the eval-management tool, or want a polished version for the sponsor or exec audience. The markdown above stays paste-ready either way.*

**If the SE accepts, render:**

1. Read the Typst template at `references/plan-template.typ`.
2. Derive the customer slug from the customer name captured in Step 1's thread-specifics:
   - Lowercase the customer name.
   - Replace whitespace and non-alphanumeric characters with hyphens (`-`).
   - Collapse multiple consecutive hyphens into one.
   - Strip leading and trailing hyphens.
   - Example: *"Globex Federal Bank"* → `globex-federal-bank`.
3. **Fallback.** If the customer name is missing or thread-specifics didn't capture it, derive the slug from today's date as `eval-plan-YYYY-MM-DD` (e.g., `eval-plan-2026-05-11`). Do not block the render on a missing customer name.
4. Substitute the plan's field values into the template's placeholder markers (`{{customer_name}}`, `{{business_decision}}`, `{{criteria}}`, `{{scope_items}}`, `{{stakeholder_table}}`, `{{validation_env}}`, `{{timeline}}`, `{{detector_check}}`).
5. Save the substituted source as `eval-plan-<customer-slug>.typ`.
6. Run `typst compile eval-plan-<customer-slug>.typ eval-plan-<customer-slug>.pdf` via Bash.
7. **On success,** confirm: *"Done. `eval-plan-<customer-slug>.pdf` is saved alongside this conversation. The markdown above is still paste-ready for the eval-management tool; the PDF is for anywhere else you need to share it."*
8. **On `typst compile` failure** (template syntax error, missing fonts, etc.), surface the stderr and offer to share the `.typ` source so the SE can compile elsewhere: *"typst compile failed: [error]. The `.typ` source is saved if you'd like to compile it elsewhere, or share me the error and I can adjust."*

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

- The business decision is present and contains all four parts: observable outcome, decision-maker, deal outcome, date.
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
- `references/per-field-questions.md` — structured AskUserQuestion option sets for the ask-then-draft beats (2.3–2.6). Read the corresponding section before each AskUserQuestion call in Step 2.
- `references/plan-template.typ` — Typst source template for the PDF render. Used in Workflow step 6 when typst is available and the SE accepts the render offer. Carries placeholder markers (`{{customer_name}}`, `{{business_decision}}`, etc.) for substitution from the plan's field values.
