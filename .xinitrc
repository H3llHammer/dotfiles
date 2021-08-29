#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
. /etc/X11/Xsession
session=${1:-xfce}

case $session in
    spectrwm                    ) exec spectrwm;;
    qtile			) exec qtile start;;
    openbox	         	) exec openbox;;
    # No known session, try to run it as command
    *				) exec $1;;
esac

xrdb -merge ~/.Xresources
