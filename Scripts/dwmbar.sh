#!/bin/sh

vol()
{
    echo $(amixer get Master | awk ' /Front Left:/ { if ( $6 == "[on]" ) print "^c#61AFEF^ " $5"^d^"; else print "^c#FF0000^婢 " $6"^d^" }' | tr -d "[]")
}

mic()
{
    echo $(amixer get Capture | awk '/Front Left:/ { if ( $6 == "[on]" ) print "^c#61AFEF^ " $5"^d^"; else print "^c#FF0000^ " $6"^d^" }' | tr -d "[]")
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
    xsetroot -name " $(vol) | $(mic) |  $(kern) | ^c#5EAAA8^$(dat)^d^ "
    sleep 1m
done
