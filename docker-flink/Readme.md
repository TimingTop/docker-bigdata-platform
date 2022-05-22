## build all image
```sh
docker build -t timing2022/hadoop-base:1.0.0-hadoop3.3.2-java11 ./docker-hadoop/base
docker build -t timing2022/hadoop-namenode ./docker-hadoop/namenode
docker build -t timing2022/hadoop-datanode ./docker-hadoop/datanode
docker build -t timing2022/hadoop-resourcemanager ./docker-hadoop/resourcemanager
docker build -t timing2022/hadoop-nodemanager ./docker-hadoop/nodemanager
docker build -t timing2022/hadoop-proxyserver ./docker-hadoop/proxyserver
docker build -t timing2022/hadoop-historyserver ./docker-hadoop/historyserver
docker build -t timing2022/flink-base:1.0.0-flink1.15.0-java11 ./docker-flink/base


```



1. 先build base 镜像, 因为要走的是 flink on yarn ,所以要依赖 hadoop 的image

docker build -t timing2022/flink-base:1.0.0-flink1.15.0-java11 ./docker-flink/base


## flink  own cluster  desprecate
jobManager   taskManager   start at least two node  

have GUI to check the job status 



## 两种 flink on yarn 的运行方式

1. 因为是 yarn session模式，所以不需要格外启动 jobmanager taskmanager, 共用一个 job资源

    cause only one applicationMaster 

2. flink run 模式，超级简单，不需要额外启动一个集群，直接提交作业，每个job 都独立占有资源
https://ci.apache.org/projects/flink/flink-docs-stable/deployment/resource-providers/yarn.html



/bin/flink run -m yarn-cluster   xxxxx/xxx/wordcount.jar


环境变量：  YARN_CONF_DIR  HADOOP_CONF_DIR  HADOOP_HOME

export HADOOP_CLASSPATH=`hadoop classpath`


只需要设置 HADOOP_CONF_DIR


/bin/flink run-application -t yarn-application /opt/flink-1.12.1/examples/batch/WordCount.jar

/bin/flink run -m yarn-cluster -yn 2 /opt/flink-1.12.1/examples/batch/WordCount.jar -input hdfs://hadoop00:9000/LICENSE -output hdfs://hadoop00:9000/wordcount-result.txt




跑 flink on yarn 的 demo

docker build -t timing2022/flink-wordcount ./job

// 创建输入文件夹
docker run --network docker-flink_hadoop --env-file hadoop.env timing2022/flink-base:1.0.0-flink1.15.0-java11 hdfs dfs -mkdir -p /demo2/input/

// 把需要统计的文件先上传到 hadoop 中
docker run --network docker-flink_hadoop --env-file hadoop.env timing2022/flink-base:1.0.0-flink1.15.0-java11 hdfs dfs -copyFromLocal -f opt/hadoop-3.3.2/README.txt /demo2/input/
// 运行统计程序
docker run --network docker-flink_hadoop --env-file hadoop.env timing2022/flink-wordcount
// 显示统计结果
docker run --network docker-flink_hadoop --env-file hadoop.env timing2022/flink-base:1.0.0-flink1.15.0-java11 hdfs dfs -cat /demo2/output

// 清楚文件
docker run --network docker-hadoop_hadoop --env-file hadoop.env timing2021/hadoop-base:1.0.0-hadoop3.2.2-java11 hdfs dfs -rm -r /demo2/output/
docker run --network docker-hadoop_hadoop --env-file hadoop.env timing2021/hadoop-base:1.0.0-hadoop3.2.2-java11 hdfs dfs -rm -r /demo2/input/
