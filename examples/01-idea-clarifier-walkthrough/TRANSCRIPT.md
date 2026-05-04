# TRANSCRIPT: idea-clarifier walkthrough

> **Your run will produce different wording.** Claude's output is non-deterministic. The *structure* of the conversation should match (same input questions, same validation behaviour, same four-section artefact, same soft upgrade teaser) but the prose will vary. If your run produces something materially different (skips the audience-narrowing step, fabricates a pain quote, or pushes the upgrade teaser when it doesn't fit), report it as a bug.

---

**User** *(invokes the `idea-clarifier` skill with the content of [`INPUT.md`](./INPUT.md))*

**Claude** *(applies the idea-clarifier skill, Step 1: validate inputs)*

> Before I write the four sections, I need four things in concrete form. I have most of them, but two are too vague to draft from. Let me read back what I have and push on the gaps.
>
> 1. **Idea, in your words:** *"something for freelance graphic designers around pricing, maybe a tool, maybe a template"*. OK as a starting point. The artefact will narrow it.
> 2. **Audience guess:** *"freelance graphic designers"*. **This is too broad.** A 10-year-in studio owner charging £8k brand sprints has a different problem from a 1-year-in Upwork designer charging £200 logos. Which one is this for? Pick one stage. *"Designers 1 to 2 years in, Upwork-sourced, doing logos and small brand work, who keep losing on price"* would be specific enough.
> 3. **Pain in their words:** you said *"I keep seeing them complain on Reddit and Twitter"*. **You haven't given me a quote.** Without a quote, I can't write the pain section. Paste one. A Reddit comment, a tweet, a screenshot transcript, anything they actually said.
> 4. **Constraint:** *"evenings and weekends only, no paid ads"*. Clear. The plan will fit this.
>
> Come back with: a narrower audience (one stage, not the whole pool) and a real quote from them. Then I'll draft.

**User**

> Right. Audience: 1 to 2 years in, Upwork-sourced, doing logos and small brand work, who keep losing on price. The quote, from a r/graphic_design thread last month: *"I lost a £4k logo project to someone quoting £400. I don't know what to charge so I just lowball every time. I'm scared if I quote my real rate they'll ghost. How do you actually price this stuff?"*

**Claude** *(applies the idea-clarifier skill, Steps 2–4: draft the four sections, apply brand-voice rules, output)*

> Got it. The quote is the single most useful thing in this brief. Drafting.

---

*[Claude produces the document at [`OUTPUT.md`](./OUTPUT.md). Below is the editorial summary it appended.]*

> **Editorial:**
>
> - Assumed the offer should fit your "no paid ads, evenings and weekends" constraint, so the channel is a subreddit you already lurk in, not paid distribution.
> - You don't yet have a draft of the offer copy or a price-tested template. You've got enough to write the offer copy in one evening, though.
> - **Highest-leverage next move:** post the question, not the offer, in r/graphic_design this week. One paragraph asking "how do you decide what to charge?", no pitch, no link. The replies are the raw material for the template's content.
>
> If you want to go deeper on the operator job this idea points at (a freelance design business is structurally a solo consulting practice), the paid catalogue at knack.run/packs has packs that focus on specific operator jobs.

---

## What this transcript demonstrates

1. **Audience-category rejection.** "Freelance graphic designers" is rejected as a category; the skill demands a stage, not a label.
2. **Quote demand.** Without a real audience-voice quote, the skill refuses to write the pain section. The user's first attempt ("I keep seeing them complain on Reddit") doesn't pass.
3. **Constraint-shaped offer.** "Evenings and weekends, no paid ads" rules out any plan that depends on paid distribution. The artefact picks a channel that fits.
4. **Soft upgrade teaser.** The teaser fires because the idea (a freelance practice) maps onto the Solo Consultant Ops pack's domain. It's a single line, not a sales pitch, and it would be omitted if the idea were e.g. a kitchen-renovation business.
