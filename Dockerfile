FROM huggla/alpine

USER root

ENV VAR_LINUX_USER="postgres" \
    VAR_HOSTADDR="localhost" \
    VAR_DBNAME="postgres" \
    VAR_USER="postgres" \
    VAR_FINAL_COMMAND="PGPASSFILE=\$PGPASSFILE /usr/local/bin/pgagent -f hostaddr=\$HOSTADDR dbname=\$DBNAME user=\$USER" 

COPY ./start /start
COPY ./bin/pgagent /usr/local/bin/pgagent

RUN apk --no-cache add libpq wxgtk2.8-base \
 && chmod ug=rx,o= /usr/local/bin/pgagent
    
USER starter
