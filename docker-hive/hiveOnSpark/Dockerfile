FROM timing2022/hive

## /etc/apt/sources.list
## apt-cache search net-tools

ENV VERSION 3.1.2
# ENV DOWNLOAD_URL http://mirrors.aliyun.com/apache/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz

###  https://www.apache.org/dyn/closer.lua/spark/spark-3.3.0/spark-3.3.0-bin-hadoop3.tgz



# RUN set -x \
#     && curl -fSL "$DOWNLOAD_URL" -o /tmp/hive.tar.gz \
#     && tar -xvf /tmp/hive.tar.gz -C /opt/ \
#     && rm /tmp/hive.tar.gz*

# RUN ln -s /opt/apache-hive-3.1.2-bin /etc/hive

# ENV HIVE_HOME=/opt/apache-hive-3.1.2-bin

# ADD run.sh /run.sh
# RUN chmod a+x /run.sh

# COPY mysql-connector-java-8.0.28.jar "$HIVE_HOME"/lib

EXPOSE 9083

CMD ["/run.sh"]