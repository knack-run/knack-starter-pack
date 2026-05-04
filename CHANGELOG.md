# Changelog

## 1.0.0 - 2026-05-04

First public release. Free, MIT-licensed.

### Added

- **`idea-clarifier` skill.** Takes a rough product idea, consulting brief, or project sketch and returns a clear audience, a pain point in the audience's own words, an offer framing (one product, one price, one channel), and a ranked first-action plan. Rejects category audiences ("founders", "marketers"), demands a real audience-voice quote before writing the pain section, and refuses to invent specifics the user didn't supply.
- **`first-skill-template` skill.** Scaffolds a new Claude Code skill at `.claude/skills/<name>/SKILL.md` from the canonical body in `skill-stub.md`. `FILL IN:` markers preserved for the user to complete; refuses to overwrite existing files.
- **Two end-to-end worked examples.** `01-idea-clarifier-walkthrough/` (a freelance graphic designer pricing brief) and `02-first-skill-template-walkthrough/` (scaffolding a `weekly-review` skill) demonstrate the load-bearing behaviours of each skill.
- Cross-platform install: `install.sh` (macOS/Linux), `install.ps1` (Windows), `install.cmd` (Windows double-click bootstrap).

### Distribution

- Available via free Polar checkout at knack.run/packs/knack-starter-pack/ (Polar collects an email and delivers the download link).
- Mirrored at github.com/knack-run/knack-starter-pack for direct git-clone installs.
