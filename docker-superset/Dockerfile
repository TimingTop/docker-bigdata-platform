FROM debian



## /etc/apt/sources.list
## apt-cache search net-tools
## install superset dependency ：  (build-essential libssl-dev libffi-dev python-dev python-pip libsasl2-dev libldap2-dev)  
## 
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    net-tools \
    curl \
    netcat \
    gnupg \
    libsnappy-dev \
    build-essential libssl-dev libffi-dev python-dev python-pip libsasl2-dev libldap2-dev \
    && rm -rf /var/lib/apt/lists/*




