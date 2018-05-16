**Note! I use Docker latest tag for development, which means that it isn't allways working. Date tags are stable.**

# pgagent-alpine
A docker image with Pgagent, based on huggla/alpine (improved security).

## Environment variables
### pre-set runtime variables.
* VAR_HOSTADDR="localhost"
* VAR_DBNAME="postgres"
* VAR_USER="postgres"

## Capabilities
Can drop all but CHOWN, FOWNER, SETGID and SETUID.
