# Secure and Minimal image of Pgagent.
# https://hub.docker.com/repository/docker/huggla/sam-pgagent

# =========================================================================
# Init
# =========================================================================
# ARGs (can be passed to Build/Final) <BEGIN>
ARG SaM_VERSION="2.0.4"
ARG PGAGENT_VERSION="4.0.0"
ARG CONTENTIMAGE1="huggla/sam-content:pgagent-$PGAGENT_VERSION"
ARG CONTENTSOURCE1="/content-app/usr/bin/pgagent"
ARG CONTENTDESTINATION1="/finalfs/usr/bin/pgagent"
ARG RUNDEPS="libpq boost1.76"
ARG STARTUPEXECUTABLES="/usr/bin/pgagent"
# ARGs (can be passed to Build/Final) </END>

# Generic template (don't edit) <BEGIN>
FROM ${CONTENTIMAGE1:-scratch} as content1
FROM ${CONTENTIMAGE2:-scratch} as content2
FROM ${CONTENTIMAGE3:-scratch} as content3
FROM ${CONTENTIMAGE4:-scratch} as content4
FROM ${CONTENTIMAGE5:-scratch} as content5
FROM ${INITIMAGE:-${BASEIMAGE:-huggla/secure_and_minimal:$SaM_VERSION-base}} as init
# Generic template (don't edit) </END>

# =========================================================================
# Build
# =========================================================================
# Generic template (don't edit) <BEGIN>
FROM ${BUILDIMAGE:-huggla/secure_and_minimal:$SaM_VERSION-build} as build
FROM ${BASEIMAGE:-huggla/secure_and_minimal:$SaM_VERSION-base} as final
COPY --from=build /finalfs /
# Generic template (don't edit) </END>

# =========================================================================
# Final
# =========================================================================
ENV VAR_LINUX_USER="postgres" \
    VAR_HOSTADDR="localhost" \
    VAR_DBNAME="postgres" \
    VAR_USER="postgres" \
    VAR_FINAL_COMMAND="PGPASSFILE=\$VAR_PGPASSFILE /usr/local/bin/pgagent -f host=\$VAR_HOSTADDR dbname=\$VAR_DBNAME user=\$VAR_USER"

# Generic template (don't edit) <BEGIN>
USER starter
ONBUILD USER root
# Generic template (don't edit) </END>
