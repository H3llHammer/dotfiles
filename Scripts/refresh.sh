#!/bin/bash

# Refresh the dwm bar

kill $(pstree -lpa | grep dwmbar -A3 | tr "," " " | awk '/sleep/ { print $3 }')
