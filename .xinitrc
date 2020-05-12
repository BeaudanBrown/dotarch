#!/usr/bin/env sh

[[ -f "$HOME/.config/Xprofile" ]] && . $HOME/.config/Xprofile
[[ -f "$HOME/.config/Xresources" ]] && xrdb -merge -I$HOME $HOME/.config/Xresources

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xset s 600 600
exec bspwm -c $HOME/.config/bspwm/bspwmrc
