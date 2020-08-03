FROM maven:3.6.3-jdk-8 as builder
WORKDIR /tmp/src
#RUN curl -sLJO https://github.com/Eneco/kafka-connect-twitter/archive/0.1.13.tar.gz && \
#    tar -xzf kafka-connect-twitter-0.1.13.tar.gz
RUN git clone -b source-connector https://github.com/scholzj/kafka-connect-twitter.git
WORKDIR /tmp/src/kafka-connect-twitter
RUN mvn package -DskipTests


FROM strimzi/kafka:0.18.0-kafka-2.5.0
USER root:root
COPY --from=builder /tmp/src/kafka-connect-twitter/target/kafka-connect-twitter-0.1-jar-with-dependencies.jar /opt/kafka/plugins/kafka-connect-twitter/
USER 1001
