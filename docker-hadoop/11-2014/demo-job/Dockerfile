FROM localhost/timing2024/hadoop-base-java11-hadoop3.3.4:1.0.0

## COPY WordCount.jar /opt/hadoop/applications/WordCount.jar

ENV JAR_FILEPATH="/opt/hadoop-3.3.6/lib/native/examples/WordCount-simple"
ENV CLASS_TO_RUN="WordCount"
ENV PARAMS="/demo1/input /demo1/output"

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]