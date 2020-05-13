#!/usr/bin/env sh

[[ -f "$HOME/.config/xprofile" ]] && . $HOME/.config/xprofile
[[ -f "$HOME/.config/xresources" ]] && xrdb -merge -I$HOME $HOME/.config/xresources

exec bspwm -c $HOME/.config/bspwm/bspwmrc
