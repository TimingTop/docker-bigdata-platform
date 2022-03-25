FROM debian

## /etc/apt/sources.list
## apt-cache search net-tools

## apt-cache search jdk
## install jdk
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    openjdk-17-jdk \
    net-tools \
    curl \
    netcat \
    gnupg \
    libsnappy-dev \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

## install kafka

## 先把 kafka 的证书拉下来
RUN curl -O https://downloads.apache.org/kafka/KEYS
RUN gpg --import KEYS

ENV KAFKA_VERSION 3.1.0

# https://downloads.apache.org/hadoop/common/hadoop-3.2.2/hadoop-3.2.2.tar.gz
# https://dlcdn.apache.org/kafka/3.1.0/kafka_2.13-3.1.0.tgz
ENV KAFKA_URL https://dlcdn.apache.org/kafka/$KAFKA_VERSION/kafka_2.13-$KAFKA_VERSION.tgz


## https://dlcdn.apache.org/kafka/3.1.0/kafka_2.13-3.1.0.tgz.asc

RUN set -x \
    && curl -fSL "$KAFKA_URL" -o /tmp/kafka.tgz \
    && curl -fSL "$KAFKA_URL.asc" -o /tmp/kafka.tgz.asc \
    && gpg --verify /tmp/kafka.tgz.asc \
    && tar -xvf /tmp/kafka.tgz -C /opt/ \
    && rm /tmp/kafka.tgz*

RUN ln -s /opt/kafka-$KAFKA_VERSION/etc/kafka /etc/kafka

RUN mkdir /opt/kafka-$KAFKA_VERSION/logs

RUN mkdir /kafka-data

ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH $HADOOP_HOME/bin/:$PATH

ADD entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

