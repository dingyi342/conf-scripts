#!/bin/bash

## FILE: /home/syrinx/conf-scripts/init.sh
## AUTHOR: Brandon Betances (Copyleft 2012)

## LICENSE: 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

## COMMENT: The purpose of this script is to clone my conf-scripts repository from github
## and symlink all of my relevant configuration files for emacs, conkeror, stumpwm, zsh,
## and various other things. 

CONF_SCRIPTS_DIR=~/conf-scripts
EMACS_DIR=~/.emacs.d
STUMPWM_FILE=~/.stumpwmrc
CONKEROR_FILE=~/.conkerorrc
DOTFILE_DIR=~/conf-scripts/dotfiles-dir

cd ~ ## NOTE: cd to ~ for symlinking

## COMMENT: clone the conf-scripts repo from github
if [ -d "$CONF_SCRIPTS_DIR" ]; then
    echo "$CONF_SCRIPTS_DIR already exists, skipping...";
    else
    git clone git@github.com:bbetances/conf-scripts
    echo "conf-scripts repo cloned, symlinking now...";
fi

## COMMENT: set up emacs configuration
echo "setting up emacs...";
if [ -d "$EMACS_DIR" ]; then
    echo "$EMACS_DIR already exists, skipping...";
    else
    ln -s $CONF_SCRIPTS_DIR/emacs-dir $EMACS_DIR
    echo "emacs configuration files linked to ~/.emacs.d";
fi

## COMMENT: set up stumpwm configuration
echo "setting up stumpwm...";
if [ -f "$STUMPWM_FILE" ]; then
    echo "$STUMPWM_FILE already exists, skipping...";
    else
    ln -s $CONF_SCRIPTS_DIR/stumpwmrc.lisp $STUMPWM_FILE
    echo "stumpwm configuration files linked to ~/.stumpwmrc."
fi

## COMMENT: set up conkeror configuration
echo "setting up conkeror...";
if [ -f "$CONKEROR_FILE" ]; then
    echo "$CONKEROR_FILE already exists, skipping...";
    else
    ln -s $CONF_SCRIPTS_DIR/conkerorrc ~/.conkerorrc
    echo "conkeror configuration files linked to ~/.conkerorrc.";
fi

## COMMENT: set up dotfiles
echo "setting up dotfiles...";
if [ -f ~/.xinit ]; then
    echo ".xinit already exists, replace it? (y/n)"
    read yn
    if [ "$yn" = "y" ]; then
	rm ~/.xinit
	ln -s $DOTFILES_DIR/xinit ~/.xinit
	echo "xinit symlinked.";
	else
	echo "skipping...";
    fi
    else
    ln -s $DOTFILES_DIR/xinit ~/.xinit
    echo "xinit symlinked.";
fi
if [ -f ~/.zshrc ]; then
    echo ".zshrc already exists, replace it? (y/n)"
    read yn
    if [ "$yn" = "y" ]; then
	rm ~/.zshrc
	ln -s $DOTFILES_DIR/zshrc ~/.zshrc
	echo "zshrc symlinked.";
	else
	echo "skipping...";
    fi
    else
    ln -s $DOTFILES_DIR/zshrc ~/.zshrc
    echo "zshrc symlinked.";
fi
if [ -f ~/.rtorrentrc ]; then
    echo ".rtorrentrc already exists, replace it? (y/n)"
    read yn
    if [ "$yn" = "y" ]; then
	rm ~/.rtorrentrc
	ln -s $DOTFILES_DIR/rtorrentrc ~/.rtorrentrc
	echo "rtorrentrc symlinked.";
	else
	echo "skipping...";
    fi
    else
    ln -s $DOTFILES_DIR/rtorrentrc ~/.rtorrentrc
    echo "rtorrentrc symlinked.";
fi

# ## COMMENT: clean everything up and prompt to run emacs.
echo "all configuration files symlinked; run emacs now? (y/n)"
read $yn
if [ "$yn" == "y" ]; then
    emacsclient -c -n
else
echo "all done here!"
fi
