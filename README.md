# agent-dotfiles

Personal coding-agent preferences, versioned in git and symlinked into place.

```bash
git clone <this-repo> ~/agent-dotfiles && ~/agent-dotfiles/install.sh
```

| Path | Linked to |
| --- | --- |
| `claude/CLAUDE.md` | `~/.claude/CLAUDE.md` |
| `cursor/rules/` | `~/.cursor/rules` |

Existing non-symlink files are moved to `*.bak.<timestamp>` before linking.
