#!/bin/bash

RED='\033[0;31m'

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
    echo $(free -h | awk '/Mem:/ { print $3 "/"$2 }')
    sleep 10
}

dat()
{
    echo $(date "+%A %d %G  %H:%M")
}

while :
do
    xsetroot -name " $(vol) | $(mic) |  $(kern) |  $(dat) "
    sleep 1m
done
