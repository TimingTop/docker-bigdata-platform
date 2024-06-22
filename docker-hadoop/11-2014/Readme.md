

https://github.com/big-data-europe/docker-hadoop

## hadoop 最基本的项目： base  namenode  datanode

1. 先build base 镜像

podman build -t timing2024/hadoop-base-java11-hadoop3.3.4:1.0.0 ./1-base2024

podman build -t timing2024/hadoop-namenode ./2-namenode
podman build -t timing2024/hadoop-datanode ./3-datanode

2. podman-compose
sudo apt install python3-pip
pip3 install podman-compose

podman-compose config
podman-compose build
podman-compose -f ./podman-compose-test.yaml up
podman-compose -f ./podman-compose-test.yaml down

3. test namenode and datanode
9000 : 是 web ui 的接口， 9870 ： 是 hdfs 的 port

namenode: http://192.168.137.103:9870
datanode: http://192.168.137.103:9864

## hadoop 进阶项目： yarn (resourcemanager + nodemanager + proxyserver)

4. yarn 相关功能
/bin/yarn  resourcemanager
/bin/yarn  nodemanager
/bin/yarn  proxyserver

podman build -t timing2024/hadoop-yarn-resourcemanager ./4-resourcemanager
podman build -t timing2024/hadoop-yarn-nodemanager ./5-nodemanager
podman build -t timing2024/hadoop-yarn-proxyserver ./6-proxyserver     不用了


## hadoop 进阶项目： historyserver   job 的历史保存期
podman build -t timing2024/hadoop-yarn-historyserver ./7-historyserver


##  run
podman-compose -f ./podman-compose.yaml up
podman-compose -f ./podman-compose.yaml down

## 环境成功测试
namenode: http://192.168.137.103:9870/       
          http://192.168.137.103:9870/
datanode: http://192.168.137.103:9864/       
          http://192.168.137.103:9864/

resourcemanager: http://192.168.137.103:8088/cluster     
                 http://192.168.137.103:8088/cluster
nodemanager: http://192.168.137.103:8042/node            
             http://192.168.137.103:8042/node

historyserver: http://192.168.137.103:8188/applicationhistory    
               http://192.168.137.103:8188/applicationhistory

-- 虚拟机的地址


## 环境搭建好，进行简单测试，跳到自己开发的 hadoop job

podman build -t timing2024/hadoop-wordcount ./demo-job

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



## mysql

