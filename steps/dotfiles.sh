#!/usr/bin/env bash
# Clone dotfiles and stow them.
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib.sh"


log "dotfiles"
load_brew
if [ ! -d "$DOTFILES_DIR/.git" ]; then
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi
command -v stow >/dev/null || { warn "stow not installed, skipping"; exit 0; }
for pkg in "${DOTFILES_PACKAGES[@]}"; do
  stow -d "$DOTFILES_DIR" -t "$HOME" "$pkg" || warn "stow $pkg reported conflicts (existing real files?)"
done
