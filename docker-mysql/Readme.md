
## pull the image from the docker hub

```sh

## start 
docker run -itd -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 --name mysql-latest mysql


docker exec -it mysql-latest /bin/bash

mysql -u root -p


```



## install
https://dev.mysql.com/doc/refman/8.0/en/binary-installation.html

bin :  mysqld client
docs: 
man: 
include   
lib : 
share
support--files  

sudo docker build -t timing2022/mysql8 ./base8

