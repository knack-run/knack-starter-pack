---
name: first-skill-template
description: Scaffold a new Claude Code skill at `.claude/skills/<name>/SKILL.md` with the canonical Knack body pattern (frontmatter, when-to-use, inputs, steps, output format, worked-example pointer, don'ts). Triggers on "scaffold a skill called X", "make me a new skill", "create a SKILL.md for X", "I want to write my first Claude Code skill". Refuses to overwrite an existing file; refuses to invent skill content the user hasn't supplied.
---

# First Skill Template

Most first-time skill authors stare at an empty `SKILL.md`, fail to find the canonical structure documented anywhere, and end up writing free-form prose that Claude Code can't reliably trigger on. This skill fixes that. It produces a structured stub with every section a good skill needs (frontmatter, when-to-use phrases, input-validation rules, numbered steps, an output format, a worked-example pointer, and a don'ts list), filled with sensible defaults and clearly-marked `FILL IN:` slots for the parts only you can write. You walk away with a file that's already half-good, and you fill in the rest.

## When to use

- *"I want to write my first skill, scaffold it for me."*
- *"Create a SKILL.md called `weekly-review` that helps me write a weekly review post."*
- *"Make me a new skill at `.claude/skills/expense-categoriser/SKILL.md`."*
- *"I've got an idea for a skill that turns a long meeting note into action items, scaffold the file."*

Don't use this skill when an existing skill already covers the job (Claude Code will surface duplicates), or when what you actually need is a slash command (a one-shot prompt template, not an opinionated reusable behaviour). If in doubt: skills are for behaviours you want Claude to apply repeatedly across sessions; commands are for prompts you want to fire from a keystroke.

## Inputs the skill demands (in one round-trip, not three)

Ask the user for **all** of these in a single grouped question. If any are missing, push back; don't proceed to scaffolding until every slot is filled.

1. **Skill name** in kebab-case (lowercase letters, digits, and hyphens; must start with a letter; no spaces, no underscores, no capitals). Examples: `weekly-review`, `expense-categoriser`, `meeting-action-extractor`. Reject `WeeklyReview`, `weekly_review`, `weekly review`.
2. **One-line trigger description** for the skill's frontmatter. What phrase or situation should make Claude reach for this skill? *"Use when the user pastes a long meeting transcript and asks for action items"* is good; *"a skill for meetings"* is too vague. The frontmatter description is the single most important line in the file; Claude uses it to decide whether to invoke.
3. **One-paragraph job-to-be-done.** Three to five sentences. What does the skill actually do, end to end? *"Take a long meeting transcript and extract a numbered list of action items, each with the owner, the deadline, and one sentence of context. Refuses to invent owners or deadlines that aren't in the transcript."* This becomes the intro paragraph of the SKILL.md.
4. **Location:** `.claude/skills/<name>/SKILL.md` (project-local, recommended for skills tied to a specific repo) or `~/.claude/skills/<name>/SKILL.md` (user-global, applied across all your projects). Default to project-local if unspecified.

If the name fails the kebab-case rule, reject and re-ask. If the description is generic ("a skill for X"), reject and demand a trigger phrase a user would actually type. If the job-to-be-done is a category ("helps with productivity"), reject and demand the specific end-to-end output.

## Steps

### 1. Validate inputs and resolve the target path

- Confirm the skill name passes the kebab-case rule above.
- Resolve the target file:
  - Project-local: `<cwd>/.claude/skills/<name>/SKILL.md` (assumes the user is at their project root; if they're not, ask).
  - User-global: `$HOME/.claude/skills/<name>/SKILL.md` on macOS/Linux, `$env:USERPROFILE\.claude\skills\<name>\SKILL.md` on Windows.
- **If the target file already exists, refuse.** Print the absolute path and ask the user whether they want to (a) pick a different name, (b) overwrite explicitly with `--force` (which the skill does not enable by default), or (c) cancel. Do not destroy existing work.

### 2. Read the canonical body template and substitute

The canonical scaffold body lives at [`skill-stub.md`](./skill-stub.md), co-located in this skill's directory. After install it sits next to this `SKILL.md` at `<claude-config-dir>/skills/first-skill-template/skill-stub.md`. Read that file, strip the leading HTML comment block (the substitution legend; not part of the output), and substitute the four variables:

- `{{SKILL_NAME}}` → the kebab-case name from input 1
- `{{TITLE_CASED_NAME}}` → the same name with hyphens replaced by spaces and each word title-cased (e.g. `weekly-review` → `Weekly Review`)
- `{{TRIGGER_DESCRIPTION}}` → the one-line trigger from input 2
- `{{JOB_TO_BE_DONE}}` → the one-paragraph intro from input 3

Leave the `FILL IN:` markers in place. They are the user-facing instructions for the parts only the user can write; do **not** invent content for them.

### 3. Create the directory and write the file

Create the parent directory if it doesn't exist (`mkdir -p` equivalent). Write the substituted body to the resolved path.

### 4. Print a short next-actions list

After writing the file, print:

- The absolute path of the new SKILL.md.
- The three sections the user needs to complete next, in order: (1) the four to six **input slots** the skill should validate, (2) the numbered **Steps** that turn inputs into output, (3) the **Don'ts** list (failures the skill should refuse to commit).
- A one-line pointer back to a worked example: *"For a worked example of a fully-filled-out skill, see `.claude/skills/idea-clarifier/SKILL.md` in the Knack Starter Pack."*

### 5. Apply the brand-voice rules to anything you generate

- **British English by default** in any prose you contribute (the title-casing, the path message); US English in code identifiers.
- **No em-dashes.** Comma, full stop, parentheses.
- **Plain English.** Avoid `regex`, `kebab-case`, `frontmatter` etc. in messages to the user unless the skill being scaffolded is itself a developer-tools skill where those terms are the right level.
- **Operator-to-operator tone.** No marketing copy, no hedging.

## Output format

A single Markdown file at the resolved path, ~70 to 100 lines after the user fills in the `FILL IN:` slots. The structure is fixed by [`skill-stub.md`](./skill-stub.md); read that file directly to see the exact section order and the substitution variables.

If the result balloons past 150 lines once filled, the skill being scaffolded is doing too many jobs and should split. Flag this to the user.

## Worked example

The fully-filled-out reference, demonstrating what every `FILL IN:` slot should resolve to in the finished article, is [`idea-clarifier/SKILL.md`](../idea-clarifier/SKILL.md) in this same pack. Read that file end to end as the worked example for what a completed skill looks like.

A walkthrough of `first-skill-template` running end-to-end against a real new-skill brief is at [`examples/02-first-skill-template-walkthrough/`](../../examples/02-first-skill-template-walkthrough/), showing input gathering, validation rejections, file scaffolding, and the next-actions list.

## Don'ts

- **Don't overwrite an existing SKILL.md without explicit user confirmation.** A first-time skill author will often try to scaffold over a file they're already drafting; destroying it is the worst possible failure mode.
- **Don't fill in the `FILL IN:` slots with invented content.** The point of the scaffolded slots is to force the user to think about their own skill's structure. Filling them in prematurely produces a file that looks complete but is generic.
- **Don't ship a frontmatter `description:` longer than 200 characters.** Claude's invocation logic reads this; long descriptions dilute the signal. One sharp sentence is better than three soft ones.
- **Don't scaffold a skill whose job-to-be-done is a category.** *"Helps with productivity"*, *"makes meetings better"*, *"automates emails"* are not jobs. Push back, demand a specific end-to-end output, then scaffold.
- **Don't generate a SKILL.md without a `## Worked example` section** (the template includes one; don't strip it). Even a placeholder pointing at a not-yet-written example is better than no section; it signals to the user that the skill isn't really finished until the example exists.
