FROM alpine:edge

RUN apk add --virtual .build-dependencies alpine-sdk subversion \
 && adduser -D -G abuild abuilder \
 && mkdir -p /var/cache/distfiles /abuild /pgagent-apks \
 && chgrp abuild /var/cache/distfiles /abuild \
 && chmod g+w /var/cache/distfiles /abuild
 
USER abuilder
 
RUN cd /abuild \
 && abuild-keygen -a -i -n \
 && svn export https://github.com/alpinelinux/aports.git/3.4-stable/testing/pgagent
#&& svn export https://github.com/alpinelinux/aports.git/trunk/main/mariadb
#https://github.com/atenart/alpine-aports/blob/master/testing/pgagent/APKBUILD
#https://github.com/alpinelinux/aports/tree/3.4-stable/testing/pgagent
#https://github.com/alpinelinux/aports.git
#https://github.com/alpinelinux/aports/tree/master/main

#FROM huggla/alpine

#USER root

#COPY ./start /start
#COPY ./bin/pgagent /usr/local/bin/pgagent

#RUN apk --no-cache add libpq wxgtk2.8-base
 
#ENV VAR_LINUX_USER="postgres" \
#    VAR_HOSTADDR="localhost" \
#    VAR_DBNAME="postgres" \
#    VAR_USER="postgres" \
#    VAR_FINAL_COMMAND="PGPASSFILE=\$VAR_PGPASSFILE /usr/local/bin/pgagent -f hostaddr=\$VAR_HOSTADDR dbname=\$VAR_DBNAME user=\$VAR_USER" 
    
#USER starter
