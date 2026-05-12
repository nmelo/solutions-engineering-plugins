// Eval Plan — Typst template for the eval-planning skill's shareable PDF render.
//
// SHAREABILITY is the design constraint. This PDF goes to the sponsor, the security
// counterpart, or the exec audience — NOT to the SE's eval-management tool. It is
// distinct from the markdown plan in three structural ways:
//
//   1. Cover block at the top — customer, status, dates, version.
//   2. NEEDS markers in body → "TBD"; gaps collected into the Open Items appendix.
//   3. Failure-mode check section is OMITTED ENTIRELY. Internal-only QA.
//
// Placeholder markers ({{name}}) are substituted by the skill before compilation.
// Run `typst compile <file>.typ <file>.pdf` after substitution.
//
// Markers in this template (names listed without delimiters to avoid cascading replace):
//
//   customer_name              string, customer name from thread-specifics
//   status_line                "Draft — to be confirmed at planning meeting on [date]"
//                              or "Final — agreed at planning meeting [date]"
//   prepared_date              today's date when the PDF is rendered
//   planning_meeting_date      planning-meeting date or [TBD]
//   plan_version               "v0.1 — Draft" by default
//   business_decision          the single if-then sentence
//   criteria                   Typst table content rows for success criteria (4 columns)
//   scope_items                Typst table content rows for scope guardrails (3 columns)
//   stakeholder_table          Typst table content rows for stakeholders (4 columns)
//   validation_env             Typst table content rows for validation environment (2 columns)
//   timeline                   bullet list of timeline events
//   open_items                 Typst table content rows for the Open Items appendix
//                              (Field / Item / Action to close)
//                              Substitute the entire "= Open items" section block with
//                              an empty string if zero NEEDS were collected — no empty
//                              appendix on clean plans.
//
// All markers are written as the bare name surrounded by curly-curly delimiters at the
// actual substitution sites in the template below.

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

#align(center)[
  #v(0.5em)
  #text(size: 24pt, weight: "bold")[Eval Plan]
  #v(0.3em)
  #text(size: 18pt)[{{customer_name}}]
  #v(1.2em)
  #text(size: 11pt, style: "italic")[{{status_line}}]
  #v(0.3em)
  #text(size: 9pt)[
    Prepared {{prepared_date}}
    #h(0.8em) · #h(0.8em)
    Planning meeting {{planning_meeting_date}}
    #h(0.8em) · #h(0.8em)
    {{plan_version}}
  ]
  #v(1em)
  #line(length: 60%, stroke: 0.5pt + gray)
]

#v(1em)

= Business decision

{{business_decision}}

= Binary success criteria

#table(
  columns: (0.4fr, 2.2fr, 2.4fr, 2fr),
  align: (center, left, left, left),
  table.header(
    [*No.*], [*Behavior*], [*Conditions*], [*Pass threshold*],
  ),
  {{criteria}}
)

= Scope guardrails

#table(
  columns: (2fr, 2.8fr, 2fr),
  align: (left, left, left),
  table.header(
    [*Item*], [*Reason*], [*Where it goes*],
  ),
  {{scope_items}}
)

= Stakeholders

#table(
  columns: (1.2fr, 1.5fr, 2.8fr, 1.0fr),
  align: (left, left, left, left),
  table.header(
    [*Role*], [*Name*], [*Stated interest*], [*Committed to*],
  ),
  {{stakeholder_table}}
)

= Validation environment

#table(
  columns: (1.2fr, 4.8fr),
  align: (left, left),
  table.header(
    [*Sub-item*], [*Specifics*],
  ),
  {{validation_env}}
)

= Timeline

{{timeline}}

= Open items

#table(
  columns: (1.5fr, 2.5fr, 3fr),
  align: (left, left, left),
  table.header(
    [*Field*], [*Item*], [*Action to close*],
  ),
  {{open_items}}
)
