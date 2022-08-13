#!/bin/bash

$HIVE_HOME/bin/hive --service hiveserver2

cd $SPARK_HOME
mv jars/hive-storage-api-2.7.2.jar .
rm -rf jars/*hive*