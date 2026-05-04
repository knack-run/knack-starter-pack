# TRANSCRIPT: first-skill-template walkthrough

> **Your run will produce different wording.** Claude's output is non-deterministic. The *structure* should match: same four input slots, same kebab-case validation, same category-rejection on vague descriptions, same file written to the resolved path with `FILL IN:` markers preserved. If your run skips a validation step, invents `FILL IN:` content, or writes over an existing file without confirmation, report it as a bug.

---

**User** *(invokes the `first-skill-template` skill with the request from [`INPUT.md`](./INPUT.md))*

**Claude** *(applies the first-skill-template skill, Step 1: gather inputs)*

> Before I scaffold the file, I need four things in concrete form:
>
> 1. **Skill name** in kebab-case (lowercase letters, digits, hyphens, must start with a letter, no spaces, no underscores). Examples: `weekly-review`, `friday-post-drafter`.
> 2. **One-line trigger description** for the frontmatter. What should make Claude reach for this skill? *"Use when the user pastes a week's worth of notes and asks for a build-in-public Friday post"* is the right shape; *"a skill for productivity"* is too vague.
> 3. **One-paragraph job-to-be-done.** Three to five sentences on what the skill does end to end.
> 4. **Location:** project-local (`<cwd>/.claude/skills/<name>/SKILL.md`) or user-global (`~/.claude/skills/<name>/SKILL.md`)? Project-local is the default.

**User**

> Name: weeklyReview. Description: a skill for productivity. Job: it takes my week's notes and writes a Friday post. Project-local.

**Claude** *(applies the first-skill-template skill, Step 1: validate inputs)*

> Two of those need fixing before I write anything.
>
> 1. **`weeklyReview` fails the kebab-case rule** (no capitals; words separated by hyphens, not camel-cased). Closest valid forms: `weekly-review`, `friday-post`, `friday-build-in-public`. Pick one.
> 2. **"A skill for productivity" is a category, not a trigger.** Claude won't know when to invoke a skill described that way. Re-write it as the situation that should fire the skill, e.g. *"Use when the user pastes a list of bullet points from the week and asks for a build-in-public post for Friday"* or *"Triggers on 'help me draft my Friday update' or 'write my weekly recap'"*. The frontmatter description is the single most important line in the file; treat it as a search query the user might type.
>
> Your job-to-be-done is fine but thin. *"It takes my week's notes and writes a Friday post"* is one sentence; the intro paragraph wants three to five and should name the output's shape (length, structure, tone). Expand or accept that the intro stays terse.

**User**

> Name: weekly-review. Description: "Use when the user pastes a week's worth of notes (shipped, didn't ship, lessons) and asks for a draft build-in-public Friday post for X. Triggers on 'draft my Friday update', 'write my weekly recap', 'turn these notes into a build-in-public post'." Job: "Take a week's notes (a list of bullets across three buckets: shipped, didn't ship, lessons) and produce a 4-tweet thread for X in build-in-public tone, no hype, with one specific number per tweet. Refuses to invent metrics that aren't in the notes." Location: project-local.

**Claude** *(applies the first-skill-template skill, Steps 2 to 4: read template, substitute, write file, print next-actions)*

> Validating: name passes, description is a real trigger, job names the output shape and the don'ts. Resolving target path: `/Users/<you>/Vibe/<project>/.claude/skills/weekly-review/SKILL.md`. File doesn't exist yet, safe to write.
>
> Reading [`skill-stub.md`](../../skills/first-skill-template/skill-stub.md), substituting the four variables, writing the file.

---

*[Claude writes the file at [`OUTPUT.md`](./OUTPUT.md). Below is the next-actions list it printed after writing.]*

> **Wrote** `.claude/skills/weekly-review/SKILL.md` (84 lines).
>
> **Three sections to fill in next, in order:**
>
> 1. **Inputs** (lines 31 to 37 in the file). Name 4 to 6 specific things you want the skill to demand from you on every invocation. For a `weekly-review` skill, candidates: the bullet list itself; the week's headline metric (one number); the audience size or growth context; any link/screenshot to embed; a constraint like "no more than 4 tweets in the thread".
> 2. **Steps** (lines 41 to 57). The numbered steps that turn your bullets into the 4-tweet thread. Things to consider: a validation step that rejects bullet lists with no metric in them; a brand-voice step that strips hype words; a length-constraint step that hard-caps tweet character counts.
> 3. **Don'ts** (lines 73 to 76). The failures the skill should refuse. Candidates from your description: don't invent metrics not in the notes; don't write more than 4 tweets; don't use "stoked", "hyped", "thrilled", "blessed".
>
> For a worked example of a fully-filled-out skill, see `.claude/skills/idea-clarifier/SKILL.md` in the Knack Starter Pack.

---

## What this transcript demonstrates

1. **Kebab-case rejection.** `weeklyReview` is rejected at validation; the user is given concrete valid alternatives, not just a "fix this" prompt.
2. **Category-trigger rejection.** "A skill for productivity" is rejected as a category; the user is shown what a real trigger looks like and asked to rewrite.
3. **Thin-job acceptance with a flag.** A one-sentence job-to-be-done isn't rejected outright (the user has agency to accept terse intros), but the skill explicitly notes the intro will read thin and offers a path to expand.
4. **No content invention.** The scaffolded file has `FILL IN:` markers in the Inputs, Steps, Output format, and Don'ts sections. The skill does not fill these in pre-emptively, even when the user's description gives strong hints; that work is for the user.
5. **Concrete next-actions.** The skill points at the line ranges in the file and gives candidate Inputs/Steps/Don'ts based on what the user said, without writing them in. The user copy-pastes the candidates if they like, or rewrites if they don't.
