FROM timing2021/hadoop-base:1.0.0-hadoop3.2.2-java11

HEALTHCHECK CMD curl -f http://localhost:8188/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8188

CMD ["/run.sh"]