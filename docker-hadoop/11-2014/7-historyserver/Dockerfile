FROM localhost/timing2024/hadoop-base-java11-hadoop3.3.4:1.0.0

HEALTHCHECK CMD curl -f http://localhost:8188/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8188

CMD ["/run.sh"]