# /etc/zsh/zprofile: system-wide .zprofile file for zsh(1).
#
# This file is sourced only for login shells (i.e. shells
# invoked with "-" as the first character of argv[0], and
# shells invoked with the -l flag.)
#
# Global Order: zshenv, zprofile, zshrc, zlogin

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    echo "Welcome! \nSelect a desktop or TWM: $(ls /usr/share/xsessions | sed 's/\./ /; s/desktop//')";
    echo "\n(Default: xfce)$> ";
    read opc;
    case $opc in
	openbox	    ) startx ~/.xinitrc openbox;;
	qtile	    ) startx ~/.xinitrc qtile;;
	spectrwm    ) startx ~/.xinitrc spectrwm;;
	*	    ) startx ~/.xinitrc;;
    esac
    #startx ~/.xinitrc 
    #exec startx
fi
