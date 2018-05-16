**Note! I use Docker latest tag for development, which means that it isn't allways working. Date tags are stable.**

# pgagent-alpine
A docker image with Pgagent, based on huggla/alpine (improved security).

## Environment variables
### pre-set runtime variables.
* VAR_HOSTADDR="localhost"
* VAR_DBNAME="postgres"
* VAR_USER="postgres"
* VAR_LINUX_USER="postgres"
* VAR_FINAL_COMMAND=
* VAR_ARGON2_PARAMS="-r" (only used if VAR_ENCRYPT_PW is set to "yes")
* VAR_SALT_FILE="/proc/sys/kernel/hostname" (only used if VAR_ENCRYPT_PW is set to "yes")

### optional runtime variables.
* VAR_password_file_&lt;name from VAR_USER&gt;_&lt;
* VAR_password_&lt;name from VAR_USER&gt;_&lt;
* VAR_ENCRYPT_PW (set to "yes" to hash password with Argon2)

## Capabilities
Can drop all but CHOWN, FOWNER, SETGID and SETUID.
