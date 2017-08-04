#!/bin/sh

FCREPO_DATA_DIR="/opt/fedora/data"
FCREPO_CONFIG_DIR="/opt/fedora/etc"
FCREPO_TMP_DIR="/opt/fedora/tmp"
TOMCAT_DIR="/opt/apache-tomcat-8.5.16"
JRE_HOME_DIR="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.121-0.b13.el7_3.x86_64/jre"

export CATALINA_BASE="$TOMCAT_DIR"; 

export CATALINA_HOME="$TOMCAT_DIR"; 

export CATALINA_TMPDIR="$FCREPO_TMP_DIR"; 

export CLASSPATH="$TOMCAT_DIR/bin/bootstrap.jar:$TOMCAT_DIR/bin/tomcat-juli.jar"

export JRE_HOME="$JRE_HOME_DIR"

export JAVA_OPTS="
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
  
  -XX:+UseConcMarkSweepGC \
  -XX:+CMSClassUnloadingEnabled \
  -XX:+DisableExplicitGC \
  -XX:ConcGCThreads=5 \
  -XX:MaxGCPauseMillis=200 \
  -XX:ParallelGCThreads=20 \
  
  -XX:MaxMetaspaceSize=512m \
  -Xms1024m \
  -Xmx1024m \

  -server
"

