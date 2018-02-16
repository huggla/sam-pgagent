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
      for user in $SHARE_USERS
      do
         user_lc=$(echo $user | xargs | tr '[:upper:]' '[:lower:]')
         envvar="password_file_$user_lc"
         eval "userpwfile=\$$envvar"
         if [ -z $userpwfile ]
         then
            envvar="password_$user_lc"
            eval "user_pw=\$$envvar"
            if [ -n "$user_pw" ]
            then
               userpwfile=$SECRET_DIR/$user"_pw"
               eval "echo \$$envvar > $userpwfile"
               eval "unset $envvar"
            else
               echo "No password given for $user."
               exit 1
            fi
         fi
         env -i $sudo "$SUDO_DIR/addpguser" "$user" "$userpwfile" $DELETE_PASSWORD_FILES
      done
      
      
      
      
      
      for user in $DATABASE_USERS
      do
         env -i $sudo "$SUDO_DIR/add2dbuserlist" $user
      done
      env -i $sudo "$SUDO_DIR/
   fi
if [ ! -e "$smbconf" ]
then
