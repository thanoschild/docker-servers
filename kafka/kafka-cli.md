create topic
```shell
kafka-topics --bootstrap-server localhost:9092 --create --topic test-topic --partitions 1 --replication-factor 1
```

delete topic
```shell
kafka-topics --bootstrap-server localhost:9092 --delete --topic test-topic
```

list topic
```shell
kafka-topics --bootstrap-server localhost:9092 --list
```

produce message
```shell
kafka-console-producer --bootstrap-server localhost:9092 --topic test-topic
```

describe message
```shell
kafka-topics --bootstrap-server localhost:9092 --describe --topic test-topic
```

list consumer groups
```shell
kafka-consumer-groups --bootstrap-server localhost:9092 --list
```

pull message
```shell
kafka-console-consumer --bootstrap-server localhost:9092 --topic test-topic --from-beginning
```