FROM huggla/alpine

USER root

ENV VAR_LINUX_USER="postgres" \
    VAR_HOSTADDR="localhost" \
    VAR_DBNAME="postgres" \
    VAR_USER="postgres"

COPY ./start /start
COPY ./bin/pgagent /usr/local/bin/pgagent

RUN apk --no-cache add libpq wxgtk2.8-base \
 && chown root:$VAR_LINUX_USER /usr/local/bin/pgagent \
 && chmod ug=rx,o= /usr/local/bin/pgagent
    
USER starter
