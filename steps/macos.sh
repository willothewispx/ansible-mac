#!/usr/bin/env bash
# macOS defaults and the key remapping LaunchAgent.
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib.sh"


log "macOS defaults"
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false

log "Key remapping LaunchAgent"
src="$ROOT/macos/$LAUNCH_AGENT.plist"
dest="$HOME/Library/LaunchAgents/$LAUNCH_AGENT.plist"
mkdir -p "$HOME/Library/LaunchAgents"
if ! cmp -s "$src" "$dest"; then
  cp "$src" "$dest"
  chmod 600 "$dest"
  launchctl bootout "gui/$(id -u)" "$dest" 2>/dev/null || true
  launchctl bootstrap "gui/$(id -u)" "$dest" || warn "launchctl bootstrap failed (will load at next login)"
fi
