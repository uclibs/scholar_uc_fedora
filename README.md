Configuration for Scholar@UC's Fedora Repository

In addition to the files in this repo, create a file called `fcrepo_variables.sh` using the format below.  Adjust each line as needed.
 ```
 #!/bin/sh

FCREPO_DATA_DIR="/mnt/hydra/fcrepo/data"
FCREPO_CONFIG_DIR="/mnt/hydra/fcrepo/etc"
FCREPO_TMP_DIR="/mnt/hydra/fcrepo/tmp"

TOMCAT_DIR="/opt/tomcat"
JRE_HOME_DIR="/usr/lib/jvm/jre"

MIN_HEAP="6000"
MAX_HEAP="6000"

MYSQL_HOST="localhost"
MYSQL_PORT="3306"
MYSQL_USER="FedoraAdmin"
MYSQL_PASS="FedoraAdmin"
```
