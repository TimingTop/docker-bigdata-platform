FROM timing2021/hadoop-base:1.0.0-hadoop3.2.2-java11
# FROM debian

## /etc/apt/sources.list
## apt-cache search net-tools

## 安装 jdk11
# RUN apt-get update \
#     && DEBIAN_FRONTEND=noninteractive \
#     apt-get install -y --no-install-recommends \
#     openjdk-11-jdk \
#     net-tools \
#     curl \
#     netcat \
#     gnupg \
#     libsnappy-dev \
#     && rm -rf /var/lib/apt/lists/*

# ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

## 安装相关证书
RUN curl -O https://dist.apache.org/repos/dist/release/flink/KEYS
RUN gpg --import KEYS

ENV FLINK_VERSION=1.12.1
ENV SCALA_VERSION=2.11

# https://downloads.apache.org/flink/flink-1.12.1/flink-1.12.1-bin-scala_2.11.tgz
ENV FLINK_URL=https://downloads.apache.org/flink/flink-$FLINK_VERSION/flink-$FLINK_VERSION-bin-scala_$SCALA_VERSION.tgz

RUN set -x \
    && curl -fSL "$FLINK_URL" -o /tmp/flink.tgz \
    && curl -fSL "$FLINK_URL.asc" -o /tmp/flink.tgz.asc \
    && gpg --verify /tmp/flink.tgz.asc \
    && tar -xvzf /tmp/flink.tgz -C /opt/ \
    && rm /tmp/flink.tgz*

RUN ln -s /opt/flink-$FLINK_VERSION/conf /etc/flink
ENV FLINK_HOME /opt/flink-$FLINK_VERSION
ENV FLINK_CONF_DIR=/etc/flink
ENV PATH $FLINK_HOME/bin/:$PATH

# ADD entrypoint.sh /entrypoint.sh
# RUN chmod a+x /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]

