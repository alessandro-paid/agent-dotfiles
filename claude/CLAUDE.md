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

## New feature work goes in a git worktree

When I ask you to start coding a new feature or fix (not a question, review, or small edit on the branch I'm already on):

1. `git fetch origin main`, then from the repo root: `git worktree add ../claude-<short-name> -b alessandro/<short-description> origin/main`. The worktree is a sibling of the repo, with a `claude-` prefix.
2. Run `pnpm install` in the worktree, then do all edits, tests and commits there — never in the main checkout.
3. Tell me the worktree path and branch name in one line.
4. Don't remove the worktree yourself; I'll clean it up after merge.
