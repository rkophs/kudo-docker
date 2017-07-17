# Docker image for Kudu
![logo](http://getkudu.io/img/logo.png)

## License
Apache License 2.0

## What is Kudu?
Kudu is an open source storage engine for structured data which supports low-latency random access together with effi- cient analytical access patterns. Kudu distributes data using horizontal partitioning and replicates each partition using Raft consensus, providing low mean-time-to-recovery and low tail latencies. Kudu is designed within the context of the Hadoop ecosystem and supports many modes of access via tools such as [Cloudera Impala](http://impala.io/), [Apache Spark](http://spark.apache.org/), and [MapReduce](https://hadoop.apache.org/).

[http://getkudu.io/](http://getkudu.io/)

## Startup

### Build & setup a master and tserver service, each with one node
```bash
docker-compose up -d
```

### Logs
```bash
docker logs -f kudu-master
docker logs -f kudu-tserver
```

### Web UI

| Component               | Port                                              |
| ----------------------- |-------------------------------------------------- |
| Master                  | [http://dockerhost:8051](http://dockerhost:8051)  |
| TabletServer            | [http://dockerhost:8050](http://dockerhost:8050)  |


### Credits
- Inspired by https://github.com/kunickiaj/kudu-docker
- Inspired by https://github.com/bigdatafoundation/docker-kudu