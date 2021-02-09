# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

PATH="$PATH:/usr/local/go/bin"
PATH="$PATH:$HOME/.rvm/bin"
PATH="$PATH:$HOME/programs/node-linux-x64/bin"
PATH="$PATH:$HOME/programs/Espressif/xtensa-esp32-elf/bin"

# proxy start
# export http_proxy=http://127.0.0.1:7777
# export https_proxy=http://127.0.0.1:7777
# proxy end
