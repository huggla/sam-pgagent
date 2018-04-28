FROM huggla/alpine

USER root

ENV REV_LINUX_USER="postgres" \
    REV_HOSTADDR="localhost" \
    REV_DBNAME="postgres" \
    REV_USER="postgres"

COPY ./bin ${BIN_DIR}

RUN apk --no-cache add libpq wxgtk2.8-base
    
USER sudoer
