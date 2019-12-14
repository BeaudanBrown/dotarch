#!/usr/bin/env sh

[ -f "$HOME/.xprofile" ] && . ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

exec i3
xsetroot -cursor_name left_ptr
