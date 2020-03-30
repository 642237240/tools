#!/usr/bin/env bash
find -type l -exec ls -l {} \;| \
grep -rn "$1"| \
awk -F" " '{printf("%s %s\n",$11,$9)}' > default.log
source parse.sh default.log
rm default.log
