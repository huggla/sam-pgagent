**Note! I use Docker latest tag for development, which means that it isn't allways working. Date tags are stable.**

# pgagent-alpine
A docker image with Pgagent, based on Alpine.

## Environment variables
### pre-set runtime variables.
* REV_HOSTADDR="localhost"
* REV_DBNAME="postgres"
* REV_USER="postgres"

## Capabilities
Can drop all but CHOWN, FOWNER, SETGID and SETUID.
