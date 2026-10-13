## Replies
- Lead with the answer in the first sentence. No preamble, no closing recap.
- Keep replies short and direct. Add detail only when I ask.
- Mention a caveat only if it changes what I should do. At most one, and put it after the answer.
- If a request is ambiguous, ask one short question instead of guessing.

## Code
- Make the smallest change that solves the problem. Prefer additive changes over rewrites.
- When there are several approaches, pick the simplest one that is easiest to understand. Don't list the alternatives unless I ask.
- No speculative abstractions, extra config, or unrelated refactors or cleanup.

## PR size and stacking
- Split work into small, additive PRs, each reviewable on its own, and stack them (say which PR each is stacked on).
- Keep each PR to one concern. Put refactors and behavior changes in separate PRs.

## My PR descriptions (overrides pr-creation-skill on length/sections)

Target: ≤12 visible rows, ~150 visible words. Layout, in order:

1. `## Summary` — 2–3 sentences: what was wrong, what this PR does about it. Mention a feature flag here if the change is behind one.
2. `## Behavior changes` — short bullets, only if behavior changed.
3. `## Testing` — always present, 1–3 bullets: how the change was tested, and what guards against breaking other things (existing suites that still pass, flags, staged rollout).
4. `## Screenshots` — only when something user-visible changed; before/after pairs.
5. Collapsed `<details>` blocks for edge cases and follow-ups — bullet fragments, not sentences.
6. Links line: ticket · stacked-on · related PRs.
7. Claude Code attribution.

- No file paths, function names, gate/lint results, local env failures, review history, or tool footers.
- Leave out safe/expected behavior and implementation details (throughput, internals).
- Keep the semantic title.
