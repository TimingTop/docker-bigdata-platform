

## docker proxy
1. 登录 aliyun
   https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors
2. 镜像工具-》 镜像加速器
   加速器地址

3.  pull  image

```

podman pull  xxxxx.com/library/busybox:latest





```



# 大数据平台相关组件的 docker 版
windows 实测可行

## 1. hadoop 相关
查看  docker-hadoop
有 hdfs  yarn  historyserver

## 2. spark 
依赖 hadoop 的镜像

## 3. flink 
依赖 hadoop 的镜像

## 4. kafka 3.1, 不依赖 zookeeper




## docker 基本命令
```sh
sudo docker pull debian

sudo docker run --name debian-test -it debian bash

```




```
sudo docker-compose up

```