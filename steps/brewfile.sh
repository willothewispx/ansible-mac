#!/usr/bin/env bash
# Install everything in the Brewfile.
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib.sh"


log "Brewfile"
load_brew
brew bundle install --file="$ROOT/Brewfile"
