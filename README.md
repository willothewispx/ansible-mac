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

## MacOs Settings
- System Settings > Trackpad > Active "Tap to click"
- System Settings > Trackpad > Deactivate "Natural scrolling"