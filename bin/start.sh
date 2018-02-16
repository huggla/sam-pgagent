#!/bin/sh
set -e
set +a
set +m
set +s
set +i

if [ -d "$SUDO_DIR" ]
then
   sudo="/usr/bin/sudo"
   if [ ! -s "$PGPASSFILE" ]
   then
      env -i $sudo "$SUDO_DIR/mkdir2root" "$(dirname "$PGPASSFILE")"
      for user in $DATABASE_USERS
      do
         env -i $sudo "$SUDO_DIR/add2dbuserlist" $user
      done
      env -i $sudo "$SUDO_DIR/
   fi
if [ ! -e "$smbconf" ]
then
