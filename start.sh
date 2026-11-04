#!/usr/bin/env bash
# Runs on every boot: re-link AGENTS.md and skills. Fast and idempotent.
set -euo pipefail

exec "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/link.sh"
