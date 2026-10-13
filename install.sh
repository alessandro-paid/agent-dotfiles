#!/usr/bin/env bash
# Symlink agent preferences from this repo into their tool locations.
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

link "$REPO/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
link "$REPO/cursor/rules" "$HOME/.cursor/rules"
