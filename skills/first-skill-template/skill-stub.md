<!--
Canonical Knack skill stub. The `first-skill-template` skill writes a copy of
this file (with the user's inputs substituted in) to
`.claude/skills/<name>/SKILL.md` when the user asks it to scaffold a new skill.

Substitution variables (the skill replaces these before writing):
  {{SKILL_NAME}}                 kebab-case skill name (e.g. `weekly-review`)
  {{TITLE_CASED_NAME}}           title-cased display name (e.g. "Weekly Review")
  {{TRIGGER_DESCRIPTION}}        one-line frontmatter description
  {{JOB_TO_BE_DONE}}             one-paragraph intro

Below the substitution lines, the body is left with `FILL IN:` markers for
the user to complete. `FILL IN:` reads as an instruction to the human author,
not as a scratch marker.
-->

---
name: {{SKILL_NAME}}
description: {{TRIGGER_DESCRIPTION}}
---

# {{TITLE_CASED_NAME}}

{{JOB_TO_BE_DONE}}

## When to use

- FILL IN: example trigger phrase 1, in the user's natural language.
- FILL IN: example trigger phrase 2.
- FILL IN: example trigger phrase 3.

Don't use this skill when FILL IN: name the boundary; what is this skill *not* for? Naming the boundary is what stops Claude misfiring on adjacent jobs.

## Inputs the skill demands (in one round-trip, not several)

Ask the user for **all** of these in a single grouped question. If any are missing or vague, push back and ask again. Don't proceed until every slot has a specific answer.

1. **FILL IN: input slot 1.** What concrete piece of information do you need? Why is it required?
2. **FILL IN: input slot 2.**
3. **FILL IN: input slot 3.**
4. **FILL IN: input slot 4.** (Add or remove slots; four to six is usually right.)

If FILL IN: which slot, when filled with a generic answer, should be rejected and re-asked? Add the rejection rule here.

## Steps

### 1. Validate inputs

FILL IN: read each answer back; what specifically should be rejected as too vague?

### 2. FILL IN: name the main transformation step

FILL IN: how do the inputs become the output?

### 3. Apply the brand-voice rules

- Direct, specific, honest, operator-tone.
- British English unless the user signals US.
- No em-dashes in output.

### 4. Output the artefact

FILL IN: what shape does the output take? Markdown? A code block? A file written to disk?

## Output format

FILL IN: name every section of the output and what it contains. Be specific. The structure is what makes the skill repeatable.

## Worked example

FILL IN: point at `examples/01-{{SKILL_NAME}}-walkthrough/` once you've authored one. A skill without a worked example is harder to evaluate; you don't know the skill works until you can demonstrate it end-to-end on a real input.

## Don'ts

- FILL IN: name a specific failure mode this skill should refuse. *"Don't invent specifics the user didn't supply"* is a good default.
- FILL IN: name a length or scope constraint. *"Don't produce more than N items"* or *"Don't go beyond N pages"* keeps output usable.
- FILL IN: name a tone or vocabulary boundary. *"Don't use words like 'leverage', 'synergy', 'ecosystem'"* is the canonical Knack starter; tailor to your audience.
- FILL IN: name a structural rule. *"Don't skip the validation step"* is common; the validation step is what makes the skill defensible.
