#!/bin/bash

function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}

run "xrandr -s 1440x900"

#run "nm-applet"
#run "variety"
#run "blueberry-tray"
#run "/usr/lib/xfce4/notifyd/xfce4-notifyd"
#run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
picom &
run "numlockx on"
run "volumeicon"
run slstatus &
sxhkd -c ~/Documents/dwm/sxhkd/sxhkdrc &
run "nitrogen --restore"

