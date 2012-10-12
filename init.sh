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


cd ~ ## NOTE: cd to ~ for symlinking
git clone git@github.com:bbetances/conf-scripts
echo "conf-scripts repo cloned, symlinking now...\n"

echo "setting up emacs...\n"
ln -s ~/conf-scripts/emacs-dir ~/.emacs.d
echo "emacs configuration files linked to ~/.emacs.d, please run \`inital-setup\' the first time emacs is started.\n"

echo "setting up stumpwm...\n"
ln -s ~/conf-scripts/stumpwm-dir/stumpwmrc.lisp ~/.stumpwmrc
echo "stumpwm configuration files linked to ~/.stumpwmrc.\n"

echo "setting up conkeror...\n"
ln -s ~/conf-scripts/conkeror-dir/conkerorrc ~/.conkerorrc
echo "conkeror configuration files linked to ~/.conkerorrc.\n"

echo "setting up dotfiles...\n"
ln -s ~/conf-scripts/dotfiles-dir/xinit ~/.xinit
echo "xinit symlinked."
ln -s ~/conf-scripts/dotfiles-dir/zshrc ~/.zshrc
echo "zshrc symlinked."
ln -s ~/conf-scripts/dotfiles-dir/rtorrentrc ~/.rtorrentrc
echo "rtorrentrc symlinked."

$yn
echo "all configuration files symlinked; run emacs now? (y/n)"
read yn
if [ "$yn" == "y" ]; then
    emacsclient -c -n
else
echo "all done here!"
fi
