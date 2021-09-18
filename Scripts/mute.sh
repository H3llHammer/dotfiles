#!/bin/sh
mute="$(amixer get Master | grep "Front .*:" | awk '$6 == "[on]" {print "true"}' | uniq)"
    
if [ $mute -a true ]; then
    amixer set Master mute &>/dev/null
else
    amixer set Master unmute &>/dev/null
fi
