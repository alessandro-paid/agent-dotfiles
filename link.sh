#!/usr/bin/env bash
# Symlink this repo's AGENTS.md and skills into each agent's config.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    mv "$dest" "$dest.bak.$(date +%s)"
  fi
  ln -sfn "$src" "$dest"
  echo "linked $dest -> $src"
}

# Global instructions: one AGENTS.md under each agent's expected name.
link "$REPO/AGENTS.md" "$HOME/.claude/CLAUDE.md"
link "$REPO/AGENTS.md" "$HOME/.codex/AGENTS.md"

# Skills: link each skill individually so other installed skills are left alone.
for skill in "$REPO"/skills/*/; do
  [ -d "$skill" ] || continue
  for dir in "$HOME/.agents/skills" "$HOME/.claude/skills" "$HOME/.cursor/skills"; do
    link "${skill%/}" "$dir/$(basename "$skill")"
  done
done
