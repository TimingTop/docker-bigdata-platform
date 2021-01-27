#!/bin/bash

## 需要 HADOOP_CONF_DIR  这个配置， flink 这个就报错，不知道为啥
$SPARK_HOME/bin/spark-submit --master yarn --class org.apache.spark.examples.SparkPi /opt/spark-3.0.1-bin-hadoop3.2/examples/jars/spark-examples_2.12-3.0.1.jar 100