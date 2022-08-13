## start

docker-compose up



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



mysql:   docker exec -it         
        mysql
        show databases;

hive:  
