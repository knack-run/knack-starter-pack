# Knack Starter Pack

[![MIT Licence](https://img.shields.io/badge/licence-MIT-blue.svg)](LICENCE.md)

> Free, MIT-licensed Claude Code skills. Turn a messy idea or brief into structured next steps in five minutes, and see how a Knack pack is shaped.

```bash
git clone https://github.com/knack-run/knack-starter-pack.git && cd knack-starter-pack && ./install.sh
```

Two skills. No licence key. No telemetry. The fastest way to see what a [Knack](https://knack.run) pack actually does.

## Who this is for

You use, or are starting to use, [Claude Code](https://claude.com/claude-code), and you want to:

- Take a rough product idea, consulting brief, or project sketch and get a clear audience, a pain point in their words, an offer framing, and a ranked first-action plan.
- See how a well-shaped Claude Code skill is structured, so you can write your own.
- Try the Knack format for free before considering a paid pack.

Solo operators, freelance consultants, fractional execs, indie hackers, builders.

## What this does not include

This is a starter pack, not a paid catalogue. So it deliberately does not:

- Run an end-to-end workflow for a specific operator role (proposals, SoWs, launch-week ops). For that, see the [paid catalogue](https://knack.run/packs/).
- Include MCP server configurations, agents, or slash-command shortcuts. Two skills only.
- Phone home, validate licences, or capture data. Everything runs locally on your machine.
- Replace your judgement. The skills demand specifics before drafting; if you give them generic answers, they push back.

## What's inside

- **[`idea-clarifier`](skills/idea-clarifier/SKILL.md)**: Take a rough product idea, consulting brief, or project sketch and get a clear audience, a pain point in the audience's own words, an offer framing (one product, one price, one channel), and a ranked first-action plan. Rejects category audiences ("founders", "marketers"), demands a real audience-voice quote before writing the pain section, and refuses to invent specifics you didn't supply.

- **[`first-skill-template`](skills/first-skill-template/SKILL.md)**: Scaffold a new Claude Code skill at `.claude/skills/<name>/SKILL.md` with the canonical Knack body pattern (frontmatter, when-to-use, inputs, steps, output format, worked-example pointer, don'ts). Refuses to overwrite an existing file.

Plus two end-to-end [worked examples](examples/) showing each skill against a realistic input.

## Install

```bash
git clone https://github.com/knack-run/knack-starter-pack.git
cd knack-starter-pack
./install.sh
```

On Windows, double-click `install.cmd` from File Explorer for the easiest path. The full Windows + non-interactive recipe is on the [pack page at knack.run](https://knack.run/packs/knack-starter-pack/).

The installer copies the two skills into your Claude Code config directory (`~/.claude/` by default; override with `CLAUDE_CONFIG_DIR`). No licence key, no prompts, no telemetry.

If you don't have Claude Code yet: it's [Anthropic's official CLI for Claude](https://claude.com/claude-code), open-source and free to use (you bring your own API key).

## Try it

Once installed, restart Claude Code and try:

```
> I have an idea for a tool that helps consultants automate their proposals.
> What do I do with it?
```

`idea-clarifier` will fire, push back on vague answers, and produce a four-section plan. The walkthrough at [`examples/01-idea-clarifier-walkthrough/`](examples/01-idea-clarifier-walkthrough/) shows the end-to-end flow against a realistic indie-hacker brief.

## Going deeper

This is the free starter pack. The paid Knack catalogue at [knack.run/packs](https://knack.run/packs/) goes deep on specific operator jobs. Each is lifetime-licensed: one-time payment, no subscription, free updates for life.

**Shipped:** [Solo Consultant Ops](https://knack.run/packs/solo-consultant-ops) — the 7-phase engagement system for independent consultants and fractional execs.

**In beta, looking for testers:** [Indie Hacker Launch](https://knack.run/packs/indie-hacker-launch) — the launch-week system for solo founders shipping their second-to-fifth product. Sign up via the page in exchange for free pack access and blunt feedback.

## Contributing

Questions, suggestions, or new-pack proposals: `hello@knack.run`.

## About Knack

Curated [Claude Code](https://claude.com/claude-code) skill packs. Lifetime licence, no subscriptions.

- Site: [knack.run](https://knack.run)
- All packs: [knack.run/packs](https://knack.run/packs/)
- X: [@knack_run](https://x.com/knack_run)
- LinkedIn: [knackrun](https://www.linkedin.com/company/knackrun)
- GitHub: [knack-run](https://github.com/knack-run)

## Licence

MIT. See [`LICENCE.md`](LICENCE.md). Use it, fork it, redistribute it, build on it, charge for it. The only thing we ask is the copyright notice stays intact.
