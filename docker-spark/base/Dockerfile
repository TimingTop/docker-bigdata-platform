FROM timing2021/hadoop-base:1.0.0-hadoop3.2.2-java11

## 安装相关证书
RUN curl -O https://downloads.apache.org/spark/KEYS
RUN gpg --import KEYS


ENV SPARK_VERSION=3.0.1
ENV HADOOP_VERSION=3.2

# https://www.apache.org/dyn/closer.lua/spark/spark-3.0.1/spark-3.0.1-bin-hadoop3.2.tgz
# https://archive.apache.org/dist/spark/spark-3.0.1/spark-3.0.1-bin-hadoop3.2.tgz
ENV SPARK_URL=https://downloads.apache.org/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION.tgz

RUN set -x \
    && curl -fSL "$SPARK_URL" -o /tmp/spark.tgz \
    && curl -fSL "$SPARK_URL.asc" -o /tmp/spark.tgz.asc \
    && gpg --verify /tmp/spark.tgz.asc \
    && tar -xvzf /tmp/spark.tgz -C /opt/ \
    && rm /tmp/spark.tgz*

RUN ln -s /opt/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION/conf /etc/spark
ENV SPARK_HOME /opt/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION
ENV SPARK_CONF_DIR=/etc/spark
ENV PATH $SPARK_HOME/bin/:$PATH

