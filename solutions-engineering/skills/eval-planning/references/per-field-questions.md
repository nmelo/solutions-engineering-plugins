# Per-field AskUserQuestion option sets for eval-planning Step 2 beats

Four structured option sets, one per ask-then-draft beat (2.3 through 2.6). The SKILL.md body cites this file once per beat — Claude reads the corresponding block, then makes the AskUserQuestion call before drafting any content for that field.

Beats 2.1 (Business decision) and 2.2 (Binary success criteria) are propose-and-iterate — the skill drafts directly from accumulated context (upstream answers + thread-specifics + deal shape) rather than asking. Those beats don't cite this file.

The options below are illustrative buckets that prompt thinking about the *shape* of the answer; the substantive answer often lands in the free-text "Other" field the tool provides automatically. Each block specifies the question text, the header chip (≤12 chars), the `multiSelect` setting, and the options as `label` + `description` pairs.

## 2.3 — Scope guardrails (what's getting parked)

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

## 2.5 — Validation environment (test bed shape)

| Field | Value |
|---|---|
| `question` | "Where does the eval actually run?" |
| `header` | "Eval env" |
| `multiSelect` | false |

| Option | Label | Description |
|---|---|---|
| 1 | Sandbox mirroring prod | An SE-prepared sandbox that mirrors the customer's stack. |
| 2 | Sandbox then prod | Sandbox first; controlled production touch in stages once sandbox passes. |
| 3 | Customer staging | The customer's own staging tenant, isolated from production. |
| 4 | Production with controls | Production environment with named controls limiting blast radius. |

If the SE picks Option 4 (Production with controls) or any answer that names the customer's production as the primary test bed without a sandbox proof first, the Sandboxed Proof detector is pre-triggering — surface its warning inside this beat before drafting the environment field. The draft step asks one prose follow-up to nail down the named integration surface, auth flow path, and test data — production posture without those specifics carries `[NEEDS: <missing piece>]`.

## 2.6 — Timeline and checkpoints (shape + cadence)

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
