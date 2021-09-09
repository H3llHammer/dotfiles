mic="$(amixer get Capture | grep "Front .*:" | awk '$6 == "[on]" {print "true"}' | uniq)"

if [ $mic -a true ]; then
    amixer set Capture nocap &>/dev/null
else
    amixer set Capture cap &>/dev/null
fi
