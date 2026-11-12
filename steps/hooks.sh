#!/usr/bin/env bash
# Enable the secret-scan pre-commit hook for this repo.
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib.sh"


log "git hooks (secret scan before commit)"
git -C "$ROOT" config core.hooksPath .githooks
