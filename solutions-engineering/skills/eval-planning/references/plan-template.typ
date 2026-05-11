// Eval Plan — Typst template for the eval-planning skill's PDF render (Workflow step 6).
//
// Placeholder markers ({{name}}) are substituted by the skill from the drafted plan's
// field values before compilation. Replace each marker with the corresponding content,
// then run `typst compile <file>.typ <file>.pdf` to produce the PDF.
//
// Markers in this template:
//   {{customer_name}}       — string, customer name as captured in thread-specifics
//   {{business_decision}}   — single sentence, the if-then business decision
//   {{criteria}}            — ordered list of 3–5 binary criteria, one per line, "+ " prefix
//   {{scope_items}}         — bullet list of out-of-scope items with reason + where-it-goes
//   {{stakeholder_table}}   — markdown-style rows; substitute as Typst table cells
//   {{validation_env}}      — prose paragraph or bullet list of the four sub-items
//   {{timeline}}            — bullet list of kickoff, checkpoint cadence, wrap-up, AE recap
//   {{detector_check}}      — bullet list of the four detectors with PASS/FAIL + notes

#set page(
  paper: "us-letter",
  margin: (x: 1in, y: 1in),
  numbering: "1 / 1",
)

#set text(
  font: "New Computer Modern",
  size: 11pt,
)

#set par(
  justify: true,
  leading: 0.65em,
)

#show heading.where(level: 1): set text(size: 20pt, weight: "bold")
#show heading.where(level: 2): set text(size: 13pt, weight: "bold")
#show heading: it => block(above: 1.2em, below: 0.6em, it)

= Eval Plan — {{customer_name}}

== Business decision

{{business_decision}}

== Binary success criteria

{{criteria}}

== Scope guardrails (out of scope)

{{scope_items}}

== Stakeholders

{{stakeholder_table}}

== Validation environment

{{validation_env}}

== Timeline

{{timeline}}

== Detector check

{{detector_check}}
