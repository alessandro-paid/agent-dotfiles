#!/usr/bin/env bash
# Ensure this repo lives at ~/agent-dotfiles, then symlink it into each agent's config.
set -euo pipefail

REPO_URL="https://github.com/alessandro-paid/agent-dotfiles.git"
TARGET="$HOME/agent-dotfiles"

if [ -d "$TARGET/.git" ]; then
  git -C "$TARGET" pull --ff-only
else
  git clone "$REPO_URL" "$TARGET"
fi

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
link "$TARGET/AGENTS.md" "$HOME/.claude/CLAUDE.md"
link "$TARGET/AGENTS.md" "$HOME/.codex/AGENTS.md"

# Skills: link each skill individually so other installed skills are left alone.
for skill in "$TARGET"/skills/*/; do
  [ -d "$skill" ] || continue
  for dir in "$HOME/.agents/skills" "$HOME/.claude/skills" "$HOME/.cursor/skills"; do
    link "${skill%/}" "$dir/$(basename "$skill")"
  done
done
