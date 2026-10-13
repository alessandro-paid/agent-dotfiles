#!/usr/bin/env bash
# Bootstrap: ensure the repo is at ~/agent-dotfiles, then run its link script.
set -euo pipefail

TARGET="$HOME/agent-dotfiles"

if [ -d "$TARGET/.git" ]; then
  git -C "$TARGET" pull --ff-only
else
  git clone https://github.com/alessandro-paid/agent-dotfiles.git "$TARGET"
fi

exec "$TARGET/link.sh"
