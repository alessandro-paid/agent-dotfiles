# agent-dotfiles

Personal coding-agent preferences, stored as markdown. `start.sh` runs `link.sh` on every boot, which symlinks it into each agent.

| Path | Linked to |
| --- | --- |
| `AGENTS.md` | `~/.claude/CLAUDE.md`, `~/.codex/AGENTS.md` |
| `skills/<name>/` | `~/.agents/skills/`, `~/.claude/skills/`, `~/.cursor/skills/` |

Existing non-symlink files are moved to `*.bak.<timestamp>` before linking.
