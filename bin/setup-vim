#!/bin/bash

# Setup everything needed to use the custom vimrc.
# This script should be run after the config-my script.
[ ! -d "${HOME}/.vim/bundle/Vundle.vim" ] && \
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
	vim -c ":PluginInstall" && \
	~/.vim/bundle/YouCompleteMe/install.py

echo $'\n * Vim is all setup!\n'

