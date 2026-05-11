---
name: closed-lost-analysis
description: >
  Helps an SE manager extract learning from a Technical Loss by reading the
  Evaluation Readout against the original Execution Plan, surfacing
  planning-stage failures the loss made visible. Bounded to the readout as
  input artifact — does not provide a retrospective framework. Use when a
  deal closes lost, when prepping for an internal review meeting, or when
  reading a readout to learn what the loss is teaching. Triggers on
  "closed-lost analysis", "lost deal retro", "we lost the deal", "why did
  we lose", "lost deal debrief", "evaluation post-mortem", or "closed-lost
  retrospective".
---

# Closed-Lost Analysis

Produce a readout-anchored learning agenda an SE manager walks into the internal review with after a Technical Loss. The agenda is not a retrospective framework. It is a section-by-section reading of the Evaluation Readout — the artifact the selling team already produced at the close of the evaluation — against the original Execution Plan, looking for the planning-stage failures the loss made visible.

The discipline is staying on the readout. A conversation that wanders off it becomes a blame conversation by default. A conversation that stays on it becomes an evidence conversation by default.

## When to Use

Fire on requests like:

- "We lost [account]. Help me run the learning conversation." The deal closed as a Technical Loss; the manager is preparing the internal review.
- "Why did we lose [account]?" The user wants a structured walk through what the readout actually shows, not a freeform post-mortem.
- "Read this readout for me and tell me what we should learn from it." Direct readout-reading request.

Do not fire for:

- The customer-facing readout meeting itself (Phase 5.2 of the evaluation process). That delivery is led by the AE; this skill is for the internal review that comes after.
- General retrospective requests not anchored to an Evaluation Readout. The skill is bounded — see Known Limitations.
- Cross-loss pattern analysis ("we lost three deals this quarter, what's the trend?"). Out of scope; see Known Limitations.

## Workflow

Run these steps in order. Any step can halt and ask the user a question — halting is correct when the upstream material isn't in place.

### 1. Confirm the inputs are real

Before producing the agenda, verify:

- The deal closed as a **Technical Loss** specifically (not a Technical Win, not "still deciding," not a customer-initiated pause). If the user is uncertain which the deal is, halt and ask — the conversation this skill produces is for Losses only.
- The **Evaluation Readout** document exists. The selling team produced it at the close of the evaluation; both SE and AE co-created it. If no readout exists, halt: the manager's first move is to ask the SE to produce one before any learning conversation runs. The skill cannot substitute a readout that was never written.
- The **original Execution Plan** (from evaluation kickoff) is available. The Plan is what the Readout's outcomes are being measured against; without it, the section-by-section comparison can't run.
- The **customer-facing readout meeting (Phase 5.2) has already happened**. The recordings or notes from that meeting are inputs to the learning conversation — the customer's own words on why they decided as they did. If Phase 5.2 hasn't run yet, halt: the internal learning conversation comes after, not before.

If the user has all four inputs, proceed. If any is missing, surface the gap and stop drafting.

### 2. Walk the readout, section by section

The readout's structure mirrors the original Execution Plan's six fields plus the final Technical Decision. For each section, produce one learning question grounded in what the readout actually says — not impression, not memory, not theory of the case. The mapping:

| Readout section | Learning question for a Loss |
|---|---|
| Business decision | Was this section concrete enough to lose against? A vague decision ("validate the approach") produces a vague loss. A concrete decision ("if criterion X, sponsor signs by date Y") produces a clear loss the team can learn from. If this section is missing or vague, that gap is the most important finding — it surfaces a planning failure, not a product failure. |
| Success criteria and outcomes | At least one criterion was a fail. Which one, and why? One level deeper: was the failed criterion the right thing to be testing, or was it a proxy for something the customer cared about but the eval never measured directly? A criterion that passed while the customer still walked away is often more informative than one that failed. |
| Scope (what got tested, what didn't) | Did out-of-scope items contain the actual decision driver? When the readout says "X was out of scope" and the loss reason involves X, the planning gap is visible. When the scope-out list held and the loss happened anyway, the gap is elsewhere. |
| Stakeholders and engagement | Who decided this, and was that person in the room at the right moments? A Project Sponsor who attended kickoff and disappeared by checkpoint three is a sponsor-engagement loss. An attendee list that names only IT-function people, when the loss reason involves security, is an audience-composition loss. |
| Validation environment | Did the test world match the customer's actual world? A loss that traces to "the sandbox didn't reflect their real network" or "the integration we tested wasn't the one they actually use" is an environment-mirroring failure, not a product failure. |
| Timeline | Did attention spoil, or did the decision arrive on time and go against us? A two-week eval that decided against the product is a real loss. A six-week eval that decided against the product is a planning loss masquerading as a product loss. |
| Technical Decision (the loss itself) | Did the selling team and the customer team mean the same thing by the Loss? "We didn't pick this product" can mean "your product failed," "your team failed," "we picked someone else for non-technical reasons," "we deferred entirely," or "we hadn't finished deciding when the meeting forced the question." Confirm which meaning is in play before drafting any learning artifact. |

For the Execution Plan's six-field structure, see the sibling skill `eval-planning` (in the `solutions-engineering` plugin); the Readout's section structure mirrors it. Do not restate the structure here.

### 3. Run the two detectors

Read `references/anti-patterns.md` and check the two detectors:

- **Unaimed Evaluation, persisting through to loss** — the readout's business-decision section is empty or vague.
- **Empty Chair, persisting through to loss** — the readout's stakeholder list shows only one organizational function.

When a detector fires, surface its trigger, its warning, and its remediation in full. Both detectors point to planning-stage failures the loss made visible — not product failures the manager should adjudicate.

The three eval-planning detectors that *do not* translate to readout-reading (Sandboxed Proof, Two-Week Flame, Unasked Demo) are deliberately omitted; see Known Limitations.

### 4. Attach the internal review meeting structure

Pull from `references/internal-review.md`:

- Who's in the room (SE + AE + manager-as-facilitator; not the customer, not the Project Sponsor, not the Executive Sponsor — they were in Phase 5.2).
- What the manager brings (the readout, the original Execution Plan, recordings or notes from Phase 5.2, and no pre-formed theory of why the deal was lost).
- The readout-anchored sequencing discipline.

Don't paste the whole reference inline; summarize.

### 5. Emit the agenda using the Output Format below

Then run the Quality Checklist before delivering.

## Output Format

Produce the agenda as a markdown block the manager pastes into the internal review invite or working doc.

```markdown
# Learning Agenda — [Customer], Technical Loss

## Inputs the manager brings
- Evaluation Readout (final version, delivered in Phase 5.2).
- Original Execution Plan (from evaluation kickoff).
- Recordings or notes from the customer-facing readout meeting (Phase 5.2).
- No pre-formed theory of why the deal was lost. The conversation derives that.

## Who's in the room
- SE who ran the evaluation.
- AE who owned the account.
- Manager, as facilitator.
- Not the customer. Not the Project Sponsor. Not the Executive Sponsor. They were in Phase 5.2; their input lives in the readout and recordings.

## Section-by-section walk
For each readout section below, the team answers the learning question from evidence in the readout and the recordings — not from memory or impression.

1. **Business decision** — [learning question, grounded in what the readout says].
2. **Success criteria and outcomes** — [learning question].
3. **Scope** — [learning question].
4. **Stakeholders and engagement** — [learning question].
5. **Validation environment** — [learning question].
6. **Timeline** — [learning question].
7. **Technical Decision** — [learning question; confirm which flavor of "Loss" is in play before drafting any artifact].

## Detector check
- Unaimed Evaluation (persisting to loss): [PASS / FIRES — note + remediation if fires].
- Empty Chair (persisting to loss): [PASS / FIRES — note + remediation if fires].

## What this agenda is not
- Not a root-cause taxonomy. The team is not classifying this loss against a scheme.
- Not a blame conversation. Stay on the readout; let evidence drive findings.
- Not a cross-loss pattern review. One readout, one conversation.
- Not the customer-facing readout meeting — that was Phase 5.2 and is already over.
```

## Quality Checklist

Verify each before delivering the agenda. If any fails, fix or surface the gap.

- All four inputs (Technical Loss confirmed, Readout, Execution Plan, Phase 5.2 recordings) are accounted for. None are missing or assumed.
- Each of the seven readout sections has a learning question that references what the readout *actually says*, not a generic "what could have gone wrong here" prompt.
- The detector check has been run; both detectors are reported, with trigger / warning / remediation in full if either fires.
- The agenda explicitly excludes the customer, the Project Sponsor, and the Executive Sponsor from the room.
- The "What this agenda is not" section is present and tells the manager what to push back on if the conversation drifts.
- No identifying customer names appear in the agenda beyond the customer the manager is reviewing.
- Nothing in the agenda reaches into the Known Limitations below. If a learning question or remediation feels like it wants a root-cause taxonomy or a cross-loss pattern, halt and surface to the user.

## Known Limitations

This skill is honestly bounded to v0.1 source. It does not do the following — if a user request crosses one of these lines, surface the boundary and explain that v2 source is needed.

- **No root-cause taxonomy.** No 5-whys, fishbone, or loss-reason categorization scheme. `[OUT OF SCOPE for v0.1]`
- **No cross-loss pattern detection.** One readout, one conversation. Detecting "three deals lost the same way" is a separate workflow that needs source not yet curated. `[OUT OF SCOPE for v0.1]`
- **No learning-routing mechanism.** How a captured lesson gets back to sales, product, or SE practice — not described in the source corpus. The agenda produces findings; routing them is the manager's call. `[OUT OF SCOPE for v0.1]`
- **No attention-drift loss detector.** The eval-planning "Two-Week Flame" detector is defensible at planning time; the readout-reading version requires source on what attention-drift losses look like in the readout. Not yet curated. `[OUT OF SCOPE for v0.1]`
- **No environment-failure loss detector.** Same shape — "Sandboxed Proof" translates cleanly at planning, but the readout-reading version needs source on environment-failure loss patterns. Not yet curated. `[OUT OF SCOPE for v0.1]`
- **No retro cadence or organizational placement.** When to run learning conversations, how often, who else attends besides the selling team and manager — not in the source. `[OUT OF SCOPE for v0.1]`
- **No description of the Evaluation Readout Worksheet itself.** The source names the Worksheet as the artifact the internal review uses, but does not describe its contents. The skill works from the Readout document, not from the Worksheet. `[OUT OF SCOPE for v0.1]`
- **Not a blame-free framing method.** The readout-anchored sequencing discipline keeps the conversation on evidence; that is the closest the source supports. Specific facilitation techniques for keeping conversations off individual fault are not yet curated. `[OUT OF SCOPE for v0.1]`

## Resources

- `references/anti-patterns.md` — the two detectors (Unaimed Evaluation persisting to loss, Empty Chair persisting to loss). Read in full before Workflow step 3. Also lists which eval-planning detectors deliberately do not translate.
- `references/internal-review.md` — the internal review meeting structure (who's in the room, what the manager brings, readout-anchored sequencing). Read before Workflow step 4.
- Sibling skill `eval-planning` (in the `solutions-engineering` plugin) — for the six-field Execution Plan structure that the Readout mirrors.
