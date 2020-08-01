# kafka-connect

## References

- [strimzi/kafka:0.18.0-kafka-2.5.0](https://hub.docker.com/layers/strimzi/kafka/0.18.0-kafka-2.5.0/images/sha256-12d5ed92510941f1569faa449665e9fc6ea544e67b7ae189ec6b8df434e121f4?context=explore)
- [Creating a Docker image from the Kafka Connect base image](https://strimzi.io/docs/operators/latest/deploying.html#creating-new-image-from-base-str)
- [Add Connectors or Software](https://docs.confluent.io/current/connect/managing/extending.html#add-additional-software)

## Plugins

```
curl -sLJO https://github.com/jcustenborder/kafka-connect-twitter/releases/download/0.2.26/kafka-connect-twitter-0.2.26.tar.gz
tar -xzf kafka-connect-twitter-0.2.26.tar.gz -C ./plugins/kafka-connect-twitter
```

