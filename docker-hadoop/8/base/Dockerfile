FROM debian

## /etc/apt/sources.list
## apt-cache search net-tools
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

##
## echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
## echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
## apt-get install gnupg
## apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
## apt list | grep jdk-8

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    net-tools \
    curl \
    netcat \
    gnupg \
    libsnappy-dev \
    && rm -rf /var/lib/apt/lists/*

COPY openlogic-openjdk-8u342-b07-linux-x64.tar.gz /tmp/

RUN tar -zxvf /tmp/openlogic-openjdk-8u342-b07-linux-x64.tar.gz -C /usr/lib/

RUN mv /usr/lib/openlogic-openjdk-8u342-b07-linux-x64 /usr/lib/openjdk8

ENV JAVA_HOME=/usr/lib/openjdk8

RUN curl -O -k https://dist.apache.org/repos/dist/release/hadoop/common/KEYS
RUN gpg --import KEYS

ENV HADOOP_VERSION 3.3.2

# https://downloads.apache.org/hadoop/common/hadoop-3.3.2/hadoop-3.3.2.tar.gz
# http://mirrors.aliyun.com/apache/hadoop/common/hadoop-3.3.2/hadoop-3.3.2.tar.gz

ENV HADOOP_URL https://downloads.apache.org/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
ENV HADOOP_URL_Ali http://mirrors.aliyun.com/apache/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
RUN set -x \
    && curl -kfSL "$HADOOP_URL_Ali" -o /tmp/hadoop.tar.gz \
    && curl -kfSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
    && gpg --verify /tmp/hadoop.tar.gz.asc \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop

RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs

RUN mkdir /hadoop-data

ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
#ENV PATH $HADOOP_HOME/bin/:$PATH
ENV PATH $JAVA_HOME/bin/:$HADOOP_HOME/bin/:$PATH

ADD entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

