#!/bin/sh

my_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $my_dir/fcrepo_variables.sh

OPTS="
  -Dfile.encoding=UTF-8 \
  -Djava.awt.headless=true \
  -Dlogback.configurationFile=$FCREPO_CONFIG_DIR/logback.xml \
  -Dfcrepo.home=$FCREPO_DATA_DIR \
  -Dfcrepo.modeshape.configuration=file:$FCREPO_CONFIG_DIR/repository.json \
  -Dfcrepo.activemq.configuration=file:$FCREPO_CONFIG_DIR/activemq.xml \
  -Dfcrepo.modeshape.index.directory=modeshape.index \
  -Dfcrepo.binary.directory=binary.store \
  -Dfcrepo.activemq.directory=activemq \
  -Dcom.arjuna.ats.arjuna.common.ObjectStoreEnvironmentBean.default.objectStoreDir=arjuna.common.object.store \
  -Dcom.arjuna.ats.arjuna.objectstore.objectStoreDir=arjuna.object.store \
  -Dnet.sf.ehcache.skipUpdateCheck=true \
  -Djava.io.tmpdir=$FCREPO_TMP_DIR \
  -server \
"

GC_CONFIG="  
  -XX:+DisableExplicitGC \
  -XX:ConcGCThreads=5 \
  -XX:MaxGCPauseMillis=200 \
  -XX:ParallelGCThreads=20 \
"

GC_CONFIG_LARGE_HEAP="
  -XX:+UseG1GC \
"

GC_CONFIG_SMALL_HEAP="
  -XX:+UseConcMarkSweepGC \
  -XX:+CMSClassUnloadingEnabled \
"

MEMORY_CONFIG="  
  -XX:MaxMetaspaceSize=512m \
  -Xms${MIN_HEAP}m \
  -Xmx${MAX_HEAP}m \
"

MYSQL_CONFIG="
  -Dfcrepo.mysql.username=$MYSQL_USER \
  -Dfcrepo.mysql.password=$MYSQL_PASS \
  -Dfcrepo.mysql.host=$MYSQL_HOST \
  -Dfcrepo.mysql.port=$MYSQL_PORT \
"

if [ ${MIN_HEAP} -gt 4096 ]
  then
    export JAVA_OPTS="$OPTS $MYSQL_CONFIG $GC_CONFIG $GC_CONFIG_LARGE_HEAP $MEMORY_CONFIG"
  else
    export JAVA_OPTS="$OPTS $MYSQL_CONFIG $GC_CONFIG $GC_CONFIG_SMALL_HEAP $MEMORY_CONFIG"
fi

export CATALINA_BASE="$TOMCAT_DIR"; 

export CATALINA_HOME="$TOMCAT_DIR"; 

export CATALINA_TMPDIR="$FCREPO_TMP_DIR"; 

export CLASSPATH="$TOMCAT_DIR/bin/bootstrap.jar:$TOMCAT_DIR/bin/tomcat-juli.jar"

export JRE_HOME="$JRE_HOME_DIR"

