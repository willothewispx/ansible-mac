# Shared config and helpers. Sourced by bootstrap.sh and every steps/*.sh.
# No secrets here: this repo is public.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREW_PREFIX="/opt/homebrew"

DOTFILES_REPO="${DOTFILES_REPO:-https://github.com/willothewispx/dotfiles.git}"
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
DOTFILES_PACKAGES=(zsh nvim)

# "id:Name"
MAS_INSTALL=("1236045954:Canary Mail" "1471867429:OTP Auth")
MAS_UNINSTALL=("408981434:iMovie" "409183694:Keynote" "409201541:Pages" "409203825:Numbers" "682658836:GarageBand")

LAUNCH_AGENT="com.local.KeyRemapping"

log()  { printf '\n==> %s\n' "$*"; }
warn() { printf 'WARN: %s\n' "$*" >&2; }

load_brew() {
  if [ -x "$BREW_PREFIX/bin/brew" ]; then
    eval "$("$BREW_PREFIX/bin/brew" shellenv)"
  fi
}
