FROM huggla/alpine

ENV REV_NAME="postgres" \
    REV_HOSTADDR="localhost" \
    REV_DBNAME="postgres" \
    REV_USER="postgres"

COPY ./bin/pgagent ${BIN_DIR}/pgagent

RUN apk --no-cache add libpq wxgtk2.8-base \
 && chown root:$REV_NAME "$BIN_DIR/pgagent" \
 && chmod g=rx,uo= "$BIN_DIR/pgagent"
    
USER sudoer
