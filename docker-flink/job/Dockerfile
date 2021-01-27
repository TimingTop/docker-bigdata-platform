FROM timing2021/flink-base:1.0.0-flink1.12.1-java11

ADD run.sh /run.sh
RUN chmod a+x /run.sh

# ENV HADOOP_CLASSPATH=`hadoop classpath`

CMD ["/run.sh"]