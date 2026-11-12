#!/usr/bin/env bash
# Install Homebrew (interactive: the installer asks for your sudo password).
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib.sh"


log "Homebrew"
if [ ! -x "$BREW_PREFIX/bin/brew" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
load_brew
command -v brew >/dev/null || { warn "brew not found after install"; exit 1; }
