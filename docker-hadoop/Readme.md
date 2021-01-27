

https://github.com/big-data-europe/docker-hadoop

hadoop 最基本的项目： base  namenode  datanode

1. 先build base 镜像

docker build -t timing2021/hadoop-base:1.0.0-hadoop3.2.2-java11 ./base


docker build -t timing2021/hadoop-namenode ./namenode
docker build -t timing2021/hadoop-datanode ./datanode

2. docker-compose
docker-compose config
docker-compose build
docker-compose up

3. test

namenode: http://127.0.0.1:9870


hadoop 进阶项目： yarn (resourcemanager + nodemanager + proxyserver)

/bin/yarn  resourcemanager
/bin/yarn  nodemanager
/bin/yarn proxyserver

docker build -t timing2021/hadoop-resourcemanager ./resourcemanager
docker build -t timing2021/hadoop-nodemanager ./nodemanager


hadoop 进阶项目： historyserver
docker build -t timing2021/hadoop-historyserver ./historyserver



环境成功测试
namenode: http://127.0.0.1:9870/
datanode: http://127.0.0.1:9864/

resourcemanager: http://127.0.0.1:8088/cluster
nodemanager: http://127.0.0.1:8042/node

historyserver: http://127.0.0.1:8188/applicationhistory



环境搭建好，进行简单测试，跳到自己开发的 hadoop job


docker build -t timing2021/hadoop-wordcount ./job

// 创建输入文件夹
docker run --network docker-hadoop_hadoop --env-file hadoop.env timing2021/hadoop-base:1.0.0-hadoop3.2.2-java11 hdfs dfs -mkdir -p /demo1/input/

// 把需要统计的文件先上传到 hadoop 中
docker run --network docker-hadoop_hadoop --env-file hadoop.env timing2021/hadoop-base:1.0.0-hadoop3.2.2-java11 hdfs dfs -copyFromLocal -f opt/hadoop-3.2.2/README.txt /demo1/input/
// 运行统计程序
docker run --network docker-hadoop_hadoop --env-file hadoop.env timing2021/hadoop-wordcount
// 显示统计结果

docker run --network docker-hadoop_hadoop --env-file hadoop.env timing2021/hadoop-base:1.0.0-hadoop3.2.2-java11 hdfs dfs -cat /demo1/output/*

// 清楚文件
docker run --network docker-hadoop_hadoop --env-file hadoop.env timing2021/hadoop-base:1.0.0-hadoop3.2.2-java11 hdfs dfs -rm -r /demo1/output/
docker run --network docker-hadoop_hadoop --env-file hadoop.env timing2021/hadoop-base:1.0.0-hadoop3.2.2-java11 hdfs dfs -rm -r /demo1/input/


如果报错 例如是什么 safemode 的错误的，就进入 namenode 的 container
hadoop dfsadmin -safemode leave

然后  docker-compose restart

