

https://github.com/big-data-europe/docker-hadoop

## hadoop 最基本的项目： base  namenode  datanode

1. 先build base 镜像

sudo docker build -t timing2022/hadoop-base:1.0.0-hadoop3.3.2-java11 ./docker-hadoop/base


sudo docker build -t timing2022/hadoop-namenode ./docker-hadoop/namenode
sudo docker build -t timing2022/hadoop-datanode ./docker-hadoop/datanode

2. docker-compose
sudo apt-get install docker-compose

docker-compose config
docker-compose build
docker-compose up

3. test

9000 : 是 web ui 的接口， 9870 ： 是 hdfs 的 port

namenode: http://127.0.0.1:9870

## hadoop 进阶项目： yarn (resourcemanager + nodemanager + proxyserver)

4. yarn 相关功能
/bin/yarn  resourcemanager
/bin/yarn  nodemanager
/bin/yarn proxyserver

sudo docker build -t timing2022/hadoop-resourcemanager ./docker-hadoop/resourcemanager
sudo docker build -t timing2022/hadoop-nodemanager ./docker-hadoop/nodemanager
sudo docker build -t timing2022/hadoop-proxyserver ./docker-hadoop/proxyserver


## hadoop 进阶项目： historyserver   job 的历史保存期
sudo docker build -t timing2022/hadoop-historyserver ./docker-hadoop/historyserver



## 环境成功测试
namenode: http://127.0.0.1:9870/       
          http://192.168.31.153:9870/
datanode: http://127.0.0.1:9864/       
          http://192.168.31.153:9864/

resourcemanager: http://127.0.0.1:8088/cluster     
                 http://192.168.31.153:8088/cluster
nodemanager: http://127.0.0.1:8042/node            
             http://192.168.31.153:8042/node

historyserver: http://127.0.0.1:8188/applicationhistory    
               http://192.168.31.153:8188/applicationhistory

-- 虚拟机的地址


## 环境搭建好，进行简单测试，跳到自己开发的 hadoop job

sudo docker build -t timing2022/hadoop-wordcount ./job

// 创建输入文件夹
docker run --network docker-hadoop_hadoop --env-file hadoop.env timing2022/hadoop-base:1.0.0-hadoop3.3.2-java11 hdfs dfs -mkdir -p /demo1/input/

// 把需要统计的文件先上传到 hadoop 中
docker run --network docker-hadoop_hadoop --env-file hadoop.env timing2022/hadoop-base:1.0.0-hadoop3.3.2-java11 hdfs dfs -copyFromLocal -f opt/hadoop-3.3.2/README.txt /demo1/input/
// 运行统计程序
docker run --network docker-hadoop_hadoop --env-file hadoop.env timing2022/hadoop-wordcount
// 显示统计结果

docker run --network docker-hadoop_hadoop --env-file hadoop.env timing2022/hadoop-base:1.0.0-hadoop3.3.2-java11 hdfs dfs -cat /demo1/output/*

// 清楚文件
docker run --network docker-hadoop_hadoop --env-file hadoop.env timing2021/hadoop-base:1.0.0-hadoop3.3.2-java11 hdfs dfs -rm -r /demo1/output/
docker run --network docker-hadoop_hadoop --env-file hadoop.env timing2021/hadoop-base:1.0.0-hadoop3.3.2-java11 hdfs dfs -rm -r /demo1/input/


如果报错 例如是什么 safemode 的错误的，就进入 namenode 的 container
hadoop dfsadmin -safemode leave

然后  docker-compose restart

