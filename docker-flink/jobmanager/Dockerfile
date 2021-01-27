FROM timing2021/flink-base:1.0.0-flink1.12.1-java11

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 6123 22 8080

CMD ["/run.sh"]