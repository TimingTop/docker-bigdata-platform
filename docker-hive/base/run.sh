#!/bin/bash


echo "JAVA_HOME=$JAVA_HOME" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh
## init the db
$HIVE_HOME/bin/schematool -initSchema -dbType mysql

$HIVE_HOME/bin/hive --service hiveserver2