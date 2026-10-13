#!/usr/bin/env bash
# Ensure this repo lives at ~/agent-dotfiles: clone if missing, pull if present.
set -euo pipefail

REPO_URL="https://github.com/alessandro-paid/agent-dotfiles.git"
TARGET="$HOME/agent-dotfiles"

if [ -d "$TARGET/.git" ]; then
  git -C "$TARGET" pull --ff-only
else
  git clone "$REPO_URL" "$TARGET"
fi
