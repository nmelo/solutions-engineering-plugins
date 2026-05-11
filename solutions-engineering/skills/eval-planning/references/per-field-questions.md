# Per-field AskUserQuestion option sets for eval-planning Step 2 beats

Three structured option sets covering the beats that call AskUserQuestion in Step 2. Usage by beat:

- **§2.3 Scope guardrails** — fallback only. Beat 2.3 runs in hybrid (additive) mode and proposes universal out-of-scope defaults inline; this §2.3 option set fires only when deal shape doesn't suggest universal defaults (rare).
- **§2.4 Stakeholders** — unconditional. Beat 2.4 runs in ask-then-draft mode and calls this every session.
- **§2.6 Timeline and checkpoints** — conditional. Beat 2.6 runs in hybrid (default-vs-override) mode and proposes the three-week default inline; this §2.6 option set fires only when override pressure is detected in accumulated context.

Beats 2.1 (Business decision) and 2.2 (Binary success criteria) are propose-and-iterate — the skill drafts directly from accumulated context (upstream answers + thread-specifics + deal shape) rather than asking. Beat 2.5 (Validation environment) is hybrid (posture-vs-details) and uses prose follow-ups for sub-item specifics, not AskUserQuestion. None of these cite this file.

The options below are illustrative buckets that prompt thinking about the *shape* of the answer; the substantive answer often lands in the free-text "Other" field the tool provides automatically. Each block specifies the question text, the header chip (≤12 chars), the `multiSelect` setting, and the options as `label` + `description` pairs.

## 2.3 — Scope guardrails (what's getting parked) — FALLBACK ONLY

| Field | Value |
|---|---|
| `question` | "What did the customer ask about during discovery that isn't on the path to the business decision?" |
| `header` | "Out of scope" |
| `multiSelect` | false |

| Option | Label | Description |
|---|---|---|
| 1 | Adjacent features | Mobile SDK, secondary integrations, related product capabilities outside the eval. |
| 2 | Migration tasks | Decommissioning the incumbent, data migration, change-management work. |
| 3 | Future roadmap | Items the customer asked about that belong on a post-purchase rollout list. |
| 4 | Compliance / certs | Certifications or audits outside what the eval directly tests. |

The SE's answer anchors the first scope-out item. In the draft step, Claude asks one prose follow-up ("What else got asked about that shouldn't ride this eval?") to surface remaining items. Each item gets paired with a one-line reason it's excluded and where it goes instead.

## 2.4 — Stakeholders (engagement composition)

| Field | Value |
|---|---|
| `question` | "Who on the customer's side is engaged with this eval so far?" |
| `header` | "Engaged" |
| `multiSelect` | false |

| Option | Label | Description |
|---|---|---|
| 1 | Sponsor + technical | The project sponsor and the technical contacts they've looped in. |
| 2 | Sponsor + security | Sponsor plus a named security or risk counterpart. |
| 3 | Sponsor + exec | Sponsor plus a higher decision-maker (often the budget owner). |
| 4 | Multi-function team | Sponsor plus security, IT, compliance, and app owners — broad coverage. |

If the SE picks Option 1 (Sponsor + technical), the Empty Chair detector is pre-triggering — surface its warning *inside this beat* before drafting the stakeholder list. The draft step then asks one prose follow-up: "Before we draft the stakeholder list, who on the security side needs to be in?" If the SE can't name one, mark the Stakeholders entry with `[NEEDS: security/risk audience]` and the Empty Chair warning rides with the plan into Step 3 (where the detector also fires structurally — defense in depth).

## 2.6 — Timeline and checkpoints (shape + cadence) — CONDITIONAL ON OVERRIDE PRESSURE

| Field | Value |
|---|---|
| `question` | "What timeline does this eval need to fit into?" |
| `header` | "Timeline" |
| `multiSelect` | false |

| Option | Label | Description |
|---|---|---|
| 1 | Two weeks tight | Kickoff in days, wrap-up at week two, daily checkpoints. |
| 2 | Two to three weeks | Kickoff in a week, wrap-up at 2-3 weeks, checkpoints every 2-3 days. |
| 3 | Four weeks | Wrap-up at week four — this triggers the Two-Week Flame detector. |
| 4 | Open-ended | No firm wrap-up — Step 1 should have caught this; the targeted halt re-surfaces. |

If the SE picks Option 3, surface the Two-Week Flame warning inside this beat with the remediation language from `references/anti-patterns.md` §4 before drafting the timeline. If the SE picks Option 4, surface the date / business-event targeted halt from Step 1 — the Step 2 timeline beat is not the place to drift past a Step 1 gap. After the timeline is drafted and confirmed, transition to Step 3 (Run the four detectors).
