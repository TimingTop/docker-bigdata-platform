FROM timing2022/hadoop-base:1.0.0-hadoop3.3.2-j8

HEALTHCHECK CMD curl -f http://localhost:8188/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8188

CMD ["/run.sh"]