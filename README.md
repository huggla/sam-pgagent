# pgagent-alpine
A docker image with Pgagent.

20181204-20190129: Pgagent 4.0, Alpine Edge

## Environment variables
### pre-set runtime variables.
* VAR_HOSTADDR="localhost"
* VAR_DBNAME="postgres"
* VAR_USER="postgres"
* VAR_LINUX_USER="postgres"
* VAR_FINAL_COMMAND="PGPASSFILE=\$VAR_PGPASSFILE /usr/local/bin/pgagent -f host=\$VAR_HOSTADDR dbname=\$VAR_DBNAME user=\$VAR_USER"
* VAR_ARGON2_PARAMS="-r" (only used if VAR_ENCRYPT_PW is set to "yes")
* VAR_SALT_FILE="/proc/sys/kernel/hostname" (only used if VAR_ENCRYPT_PW is set to "yes")

### optional runtime variables.
* VAR_password_file_&lt;name from VAR_USER&gt;
* VAR_password_&lt;name from VAR_USER&gt;
* VAR_ENCRYPT_PW (set to "yes" to hash password with Argon2)

## Capabilities
Can drop all but SETPCAP, SETGID and SETUID.

## Tips
Check also out huggla/postgres-alpine, huggla/pgadmin-alpine, huggla/pgbouncer-alpine and huggla/postgres-backup.
