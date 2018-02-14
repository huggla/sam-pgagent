#!/bin/sh -e

if [ -z "$global_username_map" ]
then
   global_username_map="$CONFIG_DIR/usermap.txt"
fi
if [ ! -e "$smbconf" ]
then
