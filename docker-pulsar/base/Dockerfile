FROM debian

## /etc/apt/sources.list
## apt-cache search net-tools

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    openjdk-11-jdk \
    net-tools \
    curl \
    netcat \
    gnupg \
    libsnappy-dev \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

ENV VERSION 2.8.3
ENV DOWNLOAD_URL http://mirrors.aliyun.com/apache/pulsar/pulsar-2.8.3/apache-pulsar-2.8.3-bin.tar.gz


RUN set -x \
    && curl -fSL "$DOWNLOAD_URL" -o /tmp/pulsar.tar.gz \
    && tar -xvf /tmp/pulsar.tar.gz -C /opt/ \
    && rm /tmp/pulsar.tar.gz*

RUN ln -s /opt/apache-pulsar-2.8.3 /etc/hadoop

ENV PULSAR_HOME=/opt/apache-pulsar-2.8.3

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 6650
EXPOSE 8080

CMD ["/run.sh"]