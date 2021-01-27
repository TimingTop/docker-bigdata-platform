

## 使用官方镜像

```
docker pull apache/superset

docker run -d -p 8080:8080 --name superset apache/superset

docker exec -it superset superset fab create-admin --username admin --firstname Superset --lastname Admin --email admin@superset.com --password admin

docker exec -it superset superset db upgrade

docker exec -it superset superset init
```

浏览器访问     http://localhost:8080/login/    admin/admin