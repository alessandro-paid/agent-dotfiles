# agent-dotfiles

Personal coding-agent preferences, written once and symlinked into every agent.

```bash
git clone <this-repo> ~/agent-dotfiles && ~/agent-dotfiles/install.sh
```

| Path | Linked to |
| --- | --- |
| `AGENTS.md` | `~/.claude/CLAUDE.md`, `~/.codex/AGENTS.md`, `~/.gemini/GEMINI.md` |
| `skills/<name>/` | `~/.agents/skills/`, `~/.claude/skills/`, `~/.cursor/skills/` |

Existing non-symlink files are moved to `*.bak.<timestamp>` before linking.
Cursor user rules live in Cursor settings, not in a file, so they aren't synced.
