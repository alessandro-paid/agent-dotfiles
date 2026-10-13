# agent-dotfiles

Personal coding-agent preferences, stored as markdown. `install.sh` clones the repo to `~/agent-dotfiles` and symlinks it into each agent.

| Path | Linked to |
| --- | --- |
| `AGENTS.md` | `~/.claude/CLAUDE.md`, `~/.codex/AGENTS.md` |
| `skills/<name>/` | `~/.agents/skills/`, `~/.claude/skills/`, `~/.cursor/skills/` |

Existing non-symlink files are moved to `*.bak.<timestamp>` before linking.
