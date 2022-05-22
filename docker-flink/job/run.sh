#!/bin/bash

export HADOOP_CLASSPATH=`hadoop classpath`
# /opt/flink-1.12.1/examples/batch/WordCount.jar

$FLINK_HOME/bin/flink run-application -t yarn-application /opt/flink-1.15.0/examples/batch/WordCount.jar -input hdfs://namenode:9000/demo2/input -output hdfs://namenode:9000/demo2/output