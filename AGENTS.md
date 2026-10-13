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
