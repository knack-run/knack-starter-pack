<!--
This is the file written by `first-skill-template` to
`.claude/skills/weekly-review/SKILL.md` in the user's project, with the four
substitution variables resolved. The leading HTML comment block from
`skill-stub.md` is stripped (it's the template's substitution legend, not
content). All `FILL IN:` markers are preserved verbatim; the user fills them
in next.

In a real run this file is written to disk, not displayed. Below is the
verbatim output for example purposes.
-->

---
name: weekly-review
description: Use when the user pastes a week's worth of notes (shipped, didn't ship, lessons) and asks for a draft build-in-public Friday post for X. Triggers on 'draft my Friday update', 'write my weekly recap', 'turn these notes into a build-in-public post'.
---

# Weekly Review

Take a week's notes (a list of bullets across three buckets: shipped, didn't ship, lessons) and produce a 4-tweet thread for X in build-in-public tone, no hype, with one specific number per tweet. Refuses to invent metrics that aren't in the notes.

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

FILL IN: point at `examples/01-weekly-review-walkthrough/` once you've authored one. A skill without a worked example is harder to evaluate; you don't know the skill works until you can demonstrate it end-to-end on a real input.

## Don'ts

- FILL IN: name a specific failure mode this skill should refuse. *"Don't invent specifics the user didn't supply"* is a good default.
- FILL IN: name a length or scope constraint. *"Don't produce more than N items"* or *"Don't go beyond N pages"* keeps output usable.
- FILL IN: name a tone or vocabulary boundary. *"Don't use words like 'leverage', 'synergy', 'ecosystem'"* is the canonical Knack starter; tailor to your audience.
- FILL IN: name a structural rule. *"Don't skip the validation step"* is common; the validation step is what makes the skill defensible.
