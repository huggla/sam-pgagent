FROM huggla/alpine

ENV REV_NAME="pgagent" \
    REV_DBNAME="postgres" \
    REV_USER="postgres"

COPY ./bin ${BIN_DIR}

RUN apk --no-cache add libpq wxgtk2.8-base
    
USER sudoer
