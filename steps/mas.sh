#!/usr/bin/env bash
# Mac App Store apps. Best effort: needs you signed in to the App Store.
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib.sh"


log "Mac App Store apps"
load_brew
command -v mas >/dev/null || { warn "mas not installed, skipping"; exit 0; }
installed="$(mas list 2>/dev/null | awk '{print $1}' || true)"

for entry in "${MAS_INSTALL[@]}"; do
  id="${entry%%:*}"; name="${entry#*:}"
  if grep -qx "$id" <<<"$installed"; then continue; fi
  mas install "$id" || warn "could not install $name (signed in to the App Store?)"
done

for entry in "${MAS_UNINSTALL[@]}"; do
  id="${entry%%:*}"; name="${entry#*:}"
  if grep -qx "$id" <<<"$installed"; then
    sudo mas uninstall "$id" || warn "could not uninstall $name"
  fi
done
