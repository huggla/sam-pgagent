ARG TAG="20181113-edge"
ARG CONTENTIMAGE1="huggla/pgagent:$TAG"
ARG CONTENTSOURCE1="/pgagent/usr/bin/pgagent"
ARG CONTENTDESTINATION1="/usr/bin/pgagent"
ARG RUNDEPS="libpq"
ARG EXECUTABLES="/usr/bin/pgagent"

#---------------Don't edit----------------
FROM ${CONTENTIMAGE1:-scratch} as content1
FROM ${CONTENTIMAGE2:-scratch} as content2
FROM ${BASEIMAGE:-huggla/base:$TAG} as base
FROM huggla/build:$TAG as build
FROM ${BASEIMAGE:-huggla/base:$TAG} as image
COPY --from=build /imagefs /
#-----------------------------------------

ENV VAR_LINUX_USER="postgres" \
    VAR_HOSTADDR="localhost" \
    VAR_DBNAME="postgres" \
    VAR_USER="postgres" \
    VAR_FINAL_COMMAND="PGPASSFILE=\$VAR_PGPASSFILE /usr/local/bin/pgagent -f hostaddr=\$VAR_HOSTADDR dbname=\$VAR_DBNAME user=\$VAR_USER" 

#---------------Don't edit----------------
USER starter
ONBUILD USER root
#-----------------------------------------
