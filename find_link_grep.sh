#!/usr/bin/env bash
find -type l -exec ls -l {} \;| \
grep -rn "$1"| \
awk -F" " '{printf "%s %s\n",$11,$9}'>1
#source parse.sh
#parsh.sh  1
