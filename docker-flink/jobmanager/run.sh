#!/bin/bash

echo "Configuring Job manager"

sed -i -e "s/jobmanager.rpc.address: localhost/jobmanager.rpc.address: `hostname -i`/g" /etc/flink/conf/flink-conf.yaml






echo "Cluster started"

$FLINK_HOME/bin/jobmanager.sh start