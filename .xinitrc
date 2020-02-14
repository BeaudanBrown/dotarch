#!/usr/bin/env sh

[ -f "$HOME/.xprofile" ] && . ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xsetroot -cursor_name left_ptr
exec bspwm -c $HOME/.config/bspwm/bspwmrc
