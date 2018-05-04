FROM huggla/alpine

USER root

COPY ./start /start
COPY ./bin/pgagent /usr/local/bin/pgagent

RUN apk --no-cache add libpq wxgtk2.8-base \
 && chmod ug=rx,o= /usr/local/bin/pgagent
 
ENV VAR_LINUX_USER="postgres" \
    VAR_HOSTADDR="localhost" \
    VAR_DBNAME="postgres" \
    VAR_USER="postgres" \
    VAR_FINAL_COMMAND="PGPASSFILE=\$VAR_PGPASSFILE /usr/local/bin/pgagent -f hostaddr=\$VAR_HOSTADDR dbname=\$VAR_DBNAME user=\$VAR_USER" 
    
USER starter
