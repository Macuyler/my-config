# My config
This is a repo containing my commonly used dotfiles and utilities.

## Setup
 - Standard
```
git clone https://github.com/macuyler/config.git
cd config
./bin/config-my {name-of-your-os}
```
 - With [mac](https://github.com/macuyler/mac)
```
mac install https://github.com/macuyler/config.git -p /bin
```

## Current Configs:
 - gitmux.conf
 - tmux.conf
 - vimrc
 - **mac**
   - bash_profile
   - clock.conf
   - qd_config
   - zprofile
   - zshrc
 - **kali**
   - bashrc
 - **ubuntu**
   - bashrc
   - qd_config
   
## Current Utils:
 - **battery**: Battery percentage for tmux status
 - **config-my**: Copies config files to your ~ dir
 - **ctf-mount**: Mount a local CTF nfs volume on mac
 - **format-branch**: Prepend branch name with "@"
 - **sandbox**: Quickly open up hidden dir to mess around in
 - **setup-vim**: Install all plugins used in the vimrc
 - **tmux-remote**: Utilizes a c-A config for nested tmux

## Misc.
To show the current git branch in the status-right, download the latest [gitmux](https://github.com/arl/gitmux/releases) build and move it to `./bin/gitmux`.

