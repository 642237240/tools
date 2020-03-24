#!/usr/bin/env bash
find -type l -exec ls -l {} \;| \
awk -F" " '{printf "%s %s\n",$11,$9}'>link.zy
