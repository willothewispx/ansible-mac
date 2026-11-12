#!/usr/bin/env bash
# Global git identity from GIT_USER_NAME / GIT_USER_EMAIL, existing config, or a prompt.
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib.sh"


log "git identity"
name="${GIT_USER_NAME:-$(git config --global user.name 2>/dev/null || true)}"
email="${GIT_USER_EMAIL:-$(git config --global user.email 2>/dev/null || true)}"
if [ -z "$name" ] && [ -t 0 ]; then read -r -p "git user.name: " name; fi
if [ -z "$email" ] && [ -t 0 ]; then read -r -p "git user.email: " email; fi
if [ -z "$name" ] || [ -z "$email" ]; then
  warn "git identity not set; export GIT_USER_NAME and GIT_USER_EMAIL and re-run"
  exit 0
fi
git config --global user.name "$name"
git config --global user.email "$email"
