FROM alpine:3.7

# Image-specific BEV_NAME variable.
# ---------------------------------------------------------------------
ENV BEV_NAME="pgagent"
# ---------------------------------------------------------------------

ENV BIN_DIR="/usr/local/bin" \
    SUDOERS_DIR="/etc/sudoers.d" \
    CONFIG_DIR="/etc/$BEV_NAME" \
    LANG="en_US.UTF-8"
ENV BUILDTIME_ENVIRONMENT="$BIN_DIR/buildtime_environment" \
    RUNTIME_ENVIRONMENT="$BIN_DIR/runtime_environment"

# Image-specific BEV_CONFIG_FILE variable and other buildtime environment variables.
# ---------------------------------------------------------------------

# ---------------------------------------------------------------------

COPY ./bin ${BIN_DIR}

# Image-specific COPY commands.
# ---------------------------------------------------------------------

# ---------------------------------------------------------------------
    
RUN (env | grep "^BEV_" > "$BUILDTIME_ENVIRONMENT" || touch "$BUILDTIME_ENVIRONMENT") \
 && (getent group $BEV_NAME || addgroup -S $BEV_NAME) \
 && (getent passwd $BEV_NAME || adduser -D -S -H -s /bin/false -u 100 -G $BEV_NAME $BEV_NAME) \
 && touch "$RUNTIME_ENVIRONMENT" \
 && apk add --no-cache sudo \
 && echo 'Defaults lecture="never"' > "$SUDOERS_DIR/docker1" \
 && echo "Defaults secure_path = \"$BIN_DIR\"" >> "$SUDOERS_DIR/docker1" \
 && echo 'Defaults env_keep = "REV_*"' > "$SUDOERS_DIR/docker2" \
 && echo "$BEV_NAME ALL=(root) NOPASSWD: $BIN_DIR/start" >> "$SUDOERS_DIR/docker2" \
 && chmod go= /bin /sbin /usr/bin /usr/sbin \
 && chmod u=rx,go= "$BIN_DIR/"* \
 && chmod u=rw,go= "$BUILDTIME_ENVIRONMENT" \
 && chown root:$BEV_NAME "$RUNTIME_ENVIRONMENT" \
 && chmod u=rw,g=w,o= "$RUNTIME_ENVIRONMENT" \
 && chmod u=rw,go= "$SUDOERS_DIR/docker"* \
 && ln /usr/bin/sudo "$BIN_DIR/sudo"

# Image-specific RUN commands.
# ---------------------------------------------------------------------
RUN apk --no-cache add libpq wxgtk2.8-base \
 && chown postgres:postgres "$BIN_DIR/pgagent" \
 && chmod 6555 "$BIN_DIR/pgagent"
# ---------------------------------------------------------------------
    
USER ${BEV_NAME}

# Image-specific runtime environment variables, prefixed with "REV_".
# ---------------------------------------------------------------------
ENV REV_DBNAME="postgres" \
    REV_USER="postgres"
# ---------------------------------------------------------------------

ENV PATH="$BIN_DIR"

CMD ["sudo","start"]
