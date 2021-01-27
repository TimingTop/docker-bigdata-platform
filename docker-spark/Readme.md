

docker build -t timing2021/spark-base:1.0.0-spark3.0.1-java11 ./base
docker build -t timing2021/spark-demopi ./job

docker run -p 4040:4040 --network docker-hadoop_hadoop --env-file ../docker-hadoop/hadoop.env timing2021/spark-demopi 



