#!/usr/bin/env bash
# Idempotent macOS bootstrap. Safe to re-run.
#   ./bootstrap.sh                 run every step
#   ./bootstrap.sh brewfile mas    run only these steps
# Each step is a standalone script in steps/ (e.g. ./steps/mas.sh).
# Shared config and helpers live in lib.sh.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ALL_STEPS=(homebrew brewfile mas git macos dotfiles hooks)
steps=("$@")
[ ${#steps[@]} -eq 0 ] && steps=("${ALL_STEPS[@]}")

for s in "${steps[@]}"; do
  if [ ! -f "$ROOT/steps/$s.sh" ]; then
    echo "Unknown step: $s (valid: ${ALL_STEPS[*]})" >&2
    exit 2
  fi
  bash "$ROOT/steps/$s.sh"
done
echo; echo "==> Done"
