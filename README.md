# my-config
This is a repo containing my commonly used dotfiles and utilities.

## Setup
```
mkdir -p ~/Code/projects
cd ~/Code/projects
git clone https://github.com/Macuyler/my-config.git
cd my-config
./bin/config-my {name-of-your-os}
```

## Current Configs:
 - vimrc
 - tmux.conf
 - gitmux.conf
 - **mac**
   - bash_profile
   - zprofile
   - zshrc
 - **kali**
   - bashrc
 - **ubuntu**
   - bashrc
   
## Current Utils:
 - **config-my**: Copies config files to your ~ dir
 - **tmux-remote**: Utilizes a c-A config for nested tmux
 - **format-branch**: Prepend branch name with "@"
 - **sandbox**: Quickly open up hidden dir to mess around in
 - **ctf-mount**: Mount a local CTF nfs volume on mac

## Misc.
To show the current git branch in the status-right, download the latest [gitmux](https://github.com/arl/gitmux/releases) build and move it to `./bin/gitmux`.
