# kafka-connect

## How to

### Add new plugins

add plugins under `/opt/kafka/plugins/`


- mysql

    ```
    curl -k -SL "http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.37.tar.gz" | tar -xzf - -C /tmp/quickstart/jars --strip-components=1 mysql-connector-java-5.1.37/mysql-connector-java-5.1.37-bin.jar
    ```
- elasticsearch
- s3


### Build docker image

```
docker run --workdir /app/src -v ${PWD}:/app/src --rm maven:3.6.3-jdk-8-slim mvn package -DskipTests
```

Check configured connector plugins

```
curl localhost:8083/connector-plugins | jq
[
  {
    "class": "com.eneco.trading.kafka.connect.twitter.TwitterSinkConnector",
    "type": "sink",
    "version": ""
  },
  {
    "class": "com.eneco.trading.kafka.connect.twitter.TwitterSourceConnector",
    "type": "source",
    "version": ""
  },
  {
    "class": "io.confluent.connect.elasticsearch.ElasticsearchSinkConnector",
    "type": "sink",
    "version": "5.5.1"
  },
  {
    "class": "org.apache.kafka.connect.file.FileStreamSinkConnector",
    "type": "sink",
    "version": "2.5.0"
  },
  {
    "class": "org.apache.kafka.connect.file.FileStreamSourceConnector",
    "type": "source",
    "version": "2.5.0"
  },
  {
    "class": "org.apache.kafka.connect.mirror.MirrorCheckpointConnector",
    "type": "source",
    "version": "1"
  },
  {
    "class": "org.apache.kafka.connect.mirror.MirrorHeartbeatConnector",
    "type": "source",
    "version": "1"
  },
  {
    "class": "org.apache.kafka.connect.mirror.MirrorSourceConnector",
    "type": "source",
    "version": "1"
  }
]
```

## Included Plugins

- [x] [twitter-connect-twitter](https://github.com/Eneco/kafka-connect-twitter) (using https://github.com/Eneco/kafka-connect-twitter/pull/53 to support the Kafka version)
- [ ] [kafka-connect-twitter](https://www.confluent.io/hub/jcustenborder/kafka-connect-twitter) (github: https://github.com/jcustenborder/kafka-connect-twitter)
- [ ] [kafka-connect-s3](https://www.confluent.io/hub/confluentinc/kafka-connect-s3)
- [x] [kafka-connect-elasticsearch](https://www.confluent.io/hub/confluentinc/kafka-connect-elasticsearch)
    - Download zip and move `libs` to `plugins`
    - Download guava-20.0.jar from https://github.com/google/guava/wiki/Release20 and put to `plugins`

## References

- [strimzi/kafka:0.18.0-kafka-2.5.0](https://hub.docker.com/layers/strimzi/kafka/0.18.0-kafka-2.5.0/images/sha256-12d5ed92510941f1569faa449665e9fc6ea544e67b7ae189ec6b8df434e121f4?context=explore)
- [Creating a Docker image from the Kafka Connect base image](https://strimzi.io/docs/operators/latest/deploying.html#creating-new-image-from-base-str)
- [Add Connectors or Software](https://docs.confluent.io/current/connect/managing/extending.html#add-additional-software)
- [4 Steps to Creating Apache Kafka Connectors with the Kafka Connect API](https://www.confluent.io/blog/create-dynamic-kafka-connect-source-connectors/)
- [Kafka ElasticSearch Connector Tutorial](https://www.confluent.io/blog/kafka-elasticsearch-connector-tutorial/)
