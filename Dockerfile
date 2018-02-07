FROM alpine:3.7

COPY ./bin/pgagent /usr/local/bin/pgagent

RUN apk --no-cache add libpq wxgtk2.8-base \
 && mkdir /run/secrets \
 && touch /run/secrets/.pgpass \
 && chown postgres:root /run/secrets/.pgpass \
 && chmod ug=r,o= /run/secrets/.pgpass \
 && chown postgres:postgres /usr/local/bin/pgagent \
 && chmod 6555 /usr/local/bin/pgagent
 
ENV PGPASSFILE="/run/secrets/.pgpass" \
    HOSTADDR="" \
    DBNAME="postgres" \
    USER="postgres"

USER nobody

ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "/usr/local/bin/pgagent -f hostaddr=${HOSTADDR} dbname=${DBNAME} user=${USER}" ]
