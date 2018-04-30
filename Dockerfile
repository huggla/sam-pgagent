FROM huggla/alpine

USER root

ENV VAR_LINUX_USER="postgres" \
    VAR_HOSTADDR="localhost" \
    VAR_DBNAME="postgres" \
    VAR_USER="postgres"

COPY ./start /start

RUN apk --no-cache add libpq wxgtk2.8-base
    
USER starter
