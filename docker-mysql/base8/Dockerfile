FROM debian

## /etc/apt/sources.list
## apt-cache search net-tools

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    net-tools \
    curl \
    netcat \
    gnupg \
    libsnappy-dev \
    && rm -rf /var/lib/apt/lists/*

ENV SQL_URL = "https://cdn.mysql.com/archives/mysql-8.0/mysql-server_8.0.27-1debian11_amd64.deb-bundle.tar"

RUN set -x \
    && curl -fSL "$SQL_URL" -o /tmp/mysql.tar \
    && tar -xvf /tmp/mysql.tar -C /opt/ \
    && rm /tmp/mysql.tar*
