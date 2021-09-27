#!/bin/bash

# Ansi color code variables
red="\e[0;91m"
blue="\e[0;94m"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
red_bg="\e[0;101m${expand_bg}"
green_bg="\e[0;102m${expand_bg}"
green="\e[0;92m"
white="\e[0;97m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"

vol()
{
    echo $(amixer get Master | awk ' /Front Left:/ { if ( $6 == "[on]" ) print " " $5; else print "婢 " $6 }' | tr -d "[]")
}

mic()
{
    echo $(amixer get Capture | awk '/Front Left:/ { if ( $6 == "[on]" ) print " " $5; else print " " $6 }' | tr -d "[]")
}

kern()
{
    echo $(uname -r)
}

mem()
{
    echo$(free -h | awk '/Mem/ { print "Used: " $3 " total: " $2 }')
}

dat()
{
    echo $(date "+%a %d %G  %H:%M")
}

while :
do
    xsetroot -name " $(vol) | $(mic) |  $(kern) |  $(dat) "
    sleep 1m
done
