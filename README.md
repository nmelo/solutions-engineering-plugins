# Solutions Engineering Plugins

Plugins for solutions engineers — patterns, anti-patterns, and structured artifacts for the moments where SE work compounds. Built for [Claude Cowork](https://claude.com/product/cowork), also compatible with [Claude Code](https://claude.com/product/claude-code).

## What ships

**solutions-engineering** v0.1.0 — one skill so far:

| Skill | What it does |
|---|---|
| **eval-planning** | Drafts an evaluation plan a sponsor signs onto before kickoff: business decision, binary success criteria, scope guardrails, stakeholders, validation environment, timeline. Pressure-tested against four ways evals quietly fail. Triggers on phrasing like "draft an eval plan", "POV plan", "evaluation brief", "how should I scope this POC". |

More skills will land incrementally.

## Why

Solutions engineering rewards two things: deep fluency in front of a prospect, and reliable execution between calls. Most of what an SE produces — discovery briefs, demo storyboards, POC plans, battlecards, proposal sections, call recaps — is structured prose written under time pressure. This plugin gives Claude a strong starting point for that work, beginning with the highest-stakes artifact in the funnel: the evaluation plan.

## Getting Started

```bash
claude plugin marketplace add nmelo/solutions-engineering-plugins
claude plugin install solutions-engineering@solutions-engineering-plugins
```

Once installed, the skill fires automatically when relevant.

## Layout

```
solutions-engineering/
├── .claude-plugin/plugin.json
└── skills/
    └── eval-planning/
        ├── SKILL.md             # Triggers and instructions
        └── references/          # Progressive-disclosure content
            ├── anti-patterns.md
            └── planning-meeting.md
```

Each skill is a directory with a `SKILL.md` (always-loaded) and optional `references/` (loaded on demand). Everything is markdown — no build step.

## Making it yours

- **Company context** — drop your product narrative, competitor list, and process specifics into the skill's `references/`.
- **Workflows** — modify `SKILL.md` to match how your team runs evaluation planning.

MCP connectors and shipped persona agents land in future versions.

## Contributing

Fork, edit, PR.

## License

[Apache License 2.0](./LICENSE)
