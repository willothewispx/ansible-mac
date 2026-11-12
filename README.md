# ansible-mac
Idempotent bootstrap for provisioning a mac.

## Bootstrap
```
./bootstrap.sh                # everything
./bootstrap.sh brewfile mas   # only some steps
task bootstrap:macos          # same via Taskfile
GIT_USER_NAME="..." GIT_USER_EMAIL="..." ./bootstrap.sh git
```
Steps: homebrew, brewfile, mas, git, macos, dotfiles, hooks.
No secrets are stored in this repo. `./bootstrap.sh hooks` enables a gitleaks pre-commit scan.

## Apps

#### Canary Mail
- Import gpg keys
- Add user in keys details to prompt the passphrase input field
- File > Re-Index on loading spinner

## MacOs Settings
- System Settings > Trackpad > Active "Tap to click"
- System Settings > Trackpad > Deactivate "Natural scrolling"
- System Settings > iCloud > iCloud Drive > Sync Desktop and Documents Folder

- System Settings > Desktop & Dock > Reduce dock size
- System Settings > Desktop & Dock > Show suggested and recent apps in Dock
- System Settings > Desktop & Dock > Minimize windows into application icon
- System Settings > Desktop & Dock > Hot corners > disable

- System Settings > Displays > Night Shift

- System Preferences > Keyboard > Adjsut Key Repeat > Fast
- System Preferences > Keyboard > Adjust Delay Until Repeat > Short
- System Preferences > Keyboard > Keyboard Shortcuts > Modifier Keys > Remap

## Misc

### Fonts
- Search available nerd fonts 
```
brew search '/font-.*-nerd-font/'
```

### kitty terminal
- debug fonts
```
kitty --debug-font-fallback
```

# disable font smoothing https://www.fontsmoothingadjuster.com/
```
defaults -currentHost write -g AppleFontSmoothing -int 0
```
Reset to default with
```
defaults -currentHost delete -g AppleFontSmoothing
```

## ToDos
