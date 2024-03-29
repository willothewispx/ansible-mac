# ansible-mac
ansible playbook for provisioning a mac

## Steps

#### 1. export $PATH
```
export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"
````

#### 2. install ansible
```
python3 -m pip install --upgrade pip
python3 -m pip install --user ansible
````

#### 3. Clone the repository

#### 4. Place vault file and password file at the root directory
- vault.yml
- .vault_pass

#### 5. Install ansible requirements
```
ansible-galaxy install -r requirements.yml
```

#### Change git remote url
```
git remote set-url origin git@github.com:willothewispx/ansible-mac.git
```

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

## ToDos
- Add ansible lint action to github