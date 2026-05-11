# Solutions Engineering Plugins

Plugins that turn Claude into a sharper teammate for solutions engineers — discovery prep, demo design, POC planning, objection handling, and the work in between. Built for [Claude Cowork](https://claude.com/product/cowork), also compatible with [Claude Code](https://claude.com/product/claude-code).

## Why

Solutions engineering rewards two things: deep fluency in front of a prospect, and reliable execution between calls. Most of what an SE produces — discovery briefs, demo storyboards, POC plans, battlecards, proposal sections, call recaps — is structured prose written under time pressure. This plugin gives Claude a strong starting point for that work. The real power comes when you customize it for your team — your product, your competitors, your process — so Claude works the way *your* SEs work.

## What's inside

| Component | What it adds |
|---|---|
| **discovery-call** *(skill)* | Drafts a discovery-call brief: target persona, qualifying questions, pain hypotheses, suggested agenda. |
| **objection-handling** *(skill)* | Generates a tailored response to a specific buyer objection — position, proof point, counter-question. |

This is the v0.1 surface. Roadmap covers demo, evaluation, proposal, call review, and competitive positioning. Skills and personas land incrementally; see release notes for what's in any given version.

## Getting Started

### Cowork

Install from [claude.com/plugins](https://claude.com/plugins/).

### Claude Code

```bash
claude plugin marketplace add nmelo/solutions-engineering-plugins
claude plugin install solutions-engineering@solutions-engineering-plugins
```

Once installed, skills fire automatically when relevant.

## How it works

```
solutions-engineering/
├── .claude-plugin/plugin.json   # Manifest
├── .mcp.json                    # Tool connections (CRM, email, chat)
├── agents/                      # Personas that orchestrate skills end-to-end
└── skills/                      # Domain knowledge Claude draws on automatically
```

- **Skills** encode SE patterns Claude reads and applies automatically when the situation calls for them.
- **Persona agents** are short orchestrators — when you reach for a complete workflow, they sequence the right skills.
- **Connectors** wire Claude to the tools an SE day depends on — CRM, email, chat, notes — via [MCP servers](https://modelcontextprotocol.io/).

Everything is file-based — markdown and JSON, no build step.

## Making it yours

These are generic starting points. They get useful when you tune them to how your team actually works:

- **Swap connectors** — edit `.mcp.json` to point at your stack.
- **Add company context** — drop your product narrative, competitor list, and process specifics into skill `references/`.
- **Adjust workflows** — modify skill instructions to match how your team runs discovery, demo, POV, and proposal cycles.

## Contributing

Plugins are just markdown. Fork, edit, PR.

## License

[Apache License 2.0](./LICENSE)
