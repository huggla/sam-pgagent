ARG TAG="20190206"
ARG CONTENTIMAGE1="huggla/pgagent:$TAG"
ARG CONTENTSOURCE1="/pgagent/usr/bin/pgagent"
ARG CONTENTDESTINATION1="/buildfs/usr/bin/pgagent"
ARG RUNDEPS="libpq boost"
ARG STARTUPEXECUTABLES="/usr/bin/pgagent"

#--------Generic template (don't edit)--------
FROM ${CONTENTIMAGE1:-scratch} as content1
FROM ${CONTENTIMAGE2:-scratch} as content2
FROM ${INITIMAGE:-${BASEIMAGE:-huggla/base:$TAG}} as init
FROM ${BUILDIMAGE:-huggla/build} as build
FROM ${BASEIMAGE:-huggla/base:$TAG} as image
ARG CONTENTSOURCE1
ARG CONTENTSOURCE1="${CONTENTSOURCE1:-/}"
ARG CONTENTDESTINATION1
ARG CONTENTDESTINATION1="${CONTENTDESTINATION1:-/buildfs/}"
ARG CONTENTSOURCE2
ARG CONTENTSOURCE2="${CONTENTSOURCE2:-/}"
ARG CONTENTDESTINATION2
ARG CONTENTDESTINATION2="${CONTENTDESTINATION2:-/buildfs/}"
ARG CLONEGITSDIR
ARG DOWNLOADSDIR
ARG MAKEDIRS
ARG MAKEFILES
ARG EXECUTABLES
ARG STARTUPEXECUTABLES
ARG EXPOSEFUNCTIONS
ARG GID0WRITABLES
ARG GID0WRITABLESRECURSIVE
ARG LINUXUSEROWNED
COPY --from=build /imagefs /
RUN [ -n "$LINUXUSEROWNED" ] && chown 102 $LINUXUSEROWNED || true
#---------------------------------------------

ENV VAR_LINUX_USER="postgres" \
    VAR_HOSTADDR="localhost" \
    VAR_DBNAME="postgres" \
    VAR_USER="postgres" \
    VAR_FINAL_COMMAND="PGPASSFILE=\$VAR_PGPASSFILE /usr/local/bin/pgagent -f host=\$VAR_HOSTADDR dbname=\$VAR_DBNAME user=\$VAR_USER"

#--------Generic template (don't edit)--------
USER starter
ONBUILD USER root
#---------------------------------------------
