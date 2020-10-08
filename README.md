# SOD

**Note**: The `master` branch may be in an *unstable or even broken state* during development. Please use [releases][github-release] instead of the `master` branch in order to get stable binaries.

![SOD Logo](docs/images/sod-horizontal.svg)

SOD  - simple outlier detection. A simple solution for detecting anomalies in a vector data stream with a focus on being:

* *Simple*: well-defined, user-facing HTTP API
* *Fast*: benchmarked 1,000 prediction/sec on core, million samples
* *Storage*: automatically maintains the actual required range of the sample data
* *Without training*: Uses the k nearest neighbor algorithm to detect anomalies without training data

## Description

SOD is written in Go. It consists of several components. The data storage system uses etcd/bbolt, which is a key/value data store on disk. SOD uploads batches of data to disk. When running SOD, the data is expanded in memory. Anomaly recognition is based on the LOF - local outlier factor method. This method uses k nearest neighbors to detect anomalies. The algorithm for determining k nearest neighbors uses a kd tree. An important component of the SOD is a notifier. It sends a POST request with a warning about anomalies to the specified address.

## LOF white paper

[LOF agorithm white paper](https://www.dbs.ifi.lmu.de/Publikationen/Papers/LOF.pdf)

## Getting started

### Getting SOD

The simplest method to run is to run the docker image and throw the necessary environment variables.

### Running SOD

SOD uses the configuration method via environment variables. 
Running SOD from the repository

```bash
go run cmd/sod
```

### License

SOD is under the Apache 2.0 license. See the [LICENSE](LICENSE) file for details.