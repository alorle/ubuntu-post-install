#!/bin/bash

local CURRENT_PWD=$(pwd)

$sh_c "apt install autoconf automake pkg-config libgtk-3-dev git gnome-themes-extra gtk2-engines-murrine -y"

WORK=/tmp/themes
$sh_c "rm -rf \"$WORK/arc-theme\""
mkdir --parents "$WORK"
cd "$WORK"
git clone https://github.com/horst3180/arc-theme --depth 1
cd "$WORK/arc-theme"
./autogen.sh --prefix=/usr
$sh_c "make install"
cd $CURRENT_PWD
$sh_c "rm -rf \"$WORK/arc-theme\""

$sh_c "gsettings set org.gnome.desktop.interface gtk-theme \"Arc-Dark\""
$sh_c "gsettings set org.gnome.desktop.wm.preferences theme \"Arc-Dark\""
