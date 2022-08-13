FROM timing2022/hadoop-base:1.0.0-hadoop3.3.2-j8

COPY WordCount.jar /opt/hadoop/applications/WordCount.jar

ENV JAR_FILEPATH="/opt/hadoop/applications/WordCount.jar"
ENV CLASS_TO_RUN="WordCount"
ENV PARAMS="/demo1/input /demo1/output"

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]