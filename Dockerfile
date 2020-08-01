FROM strimzi/kafka:0.18.0-kafka-2.5.0
USER root:root
COPY plugins/kafka-connect-twitter/usr/share/kafka-connect /opt/kafka/plugins
RUN ls /opt/kafka/plugins
USER 1001
