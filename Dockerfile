FROM alpine:3.7

COPY ./bin/pgagent /usr/local/bin/pgagent

RUN apk --no-cache add libpq wxgtk2.8-base \
 && mkdir /run/secrets \
 && touch /run/secrets/.pgpass \
 && chown postgres:postgres /run/secrets/.pgpass \
 && chmod u=r,go= /run/secrets/.pgpass \
 && chown postgres:postgres /usr/local/bin/pgagent \
 && chmod 6555 /usr/local/bin/pgagent
 
ENV PGPASSFILE=/run/secrets/.pgpass
ENV HOSTADDR=''
ENV DBNAME=postgres
ENV USER=postgres

USER nobody

ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "/usr/local/bin/pgagent -f hostaddr=${HOSTADDR} dbname=${DBNAME} user=${USER}" ]
