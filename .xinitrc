#!/usr/bin/env sh

[ -f "$XDG_CONFIG_HOME/Xprofile" ] && . $XDG_CONFIG_HOME/Xprofile
[[ -f "$XDG_CONFIG_HOME/Xresources" ]] && xrdb -merge -I$HOME $XDG_CONFIG_HOME/Xresources

xsetroot -cursor_name left_ptr
xset s 600 600
exec bspwm -c $XDG_CONFIG_HOME/bspwm/bspwmrc
