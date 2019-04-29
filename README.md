# travis-kind [![Build Status](https://travis-ci.org/xmudrii/travis-kind.svg?branch=master)](https://travis-ci.org/xmudrii/travis-kind)

This is an example showing how to run Kubernetes 1.11+ on [Travis-CI](https://travis-ci.org/) using [Kubernetes in Docker (`KinD`)](https://sigs.k8s.io/kind). For more details check the lightning talk I held on KubeCon North America 2018: ['Spawning Kubernetes in CI For Integration Tests'](https://sched.co/GrUv)
and the [follow up article on Loodse blog](https://www.loodse.com/blog/2019-03-12-running-kubernetes-in-the-ci-pipeline-/).

The recording of the talk is available on [YouTube](https://youtu.be/ZiJn7olAS1M) and the slides are available on [Sched](https://schd.ws/hosted_files/kccna18/28/Spawning%20Kubernetes%20in%20CI%20for%20Integration%20Tests.pdf):

<p align="center"><a href="http://www.youtube.com/watch?feature=player_embedded&v=ZiJn7olAS1M" target="_blank"><img src="https://img.youtube.com/vi/ZiJn7olAS1M/maxresdefault.jpg"></a></p>

## Getting Started

The [Travis-CI manifest (`.travis.yml`)](https://github.com/xmudrii/travis-kind/blob/master/.travis.yml) shows how to build a job for running integration tests, which first runs a local Kubernetes cluster using KinD (as defined in the `before_script` stage) and then runs integration tests (as defined in the `script` stage).

### Sideloading Images

When running Integration and End-to-End tests, we usually want to build an image for application we test locally. When creating a cluster, KinD runs a Docker container on the host machine (in our case on Travis-CI) which contains dependencies needed for Kubernetes, including Docker, and then runs Kubernetes in that container. For Kubernetes to be able to use images built locally, we need to sideload the image from the host machine to Docker running in the KinD's container, which can be done using the [`build_images.sh`](https://github.com/xmudrii/travis-kind/blob/master/build_images.sh) script.

## Getting Involved

If you want to learn more about KinD, check out the following resources:

* [KinD GitHub repository](https://github.com/kubernetes-sigs/kind),
* [KinD User Guide](https://github.com/kubernetes-sigs/kind/tree/master/docs/user),
* [KinD Design Overview](https://github.com/kubernetes-sigs/kind/blob/master/docs/design/design.md)

There is a [#kind](https://kubernetes.slack.com/messages/CEKK1KTN2/) channel on [Kubernetes Slack](http://slack.k8s.io/) where you can reach out to maintainers and users, and follow the development progress.

If you have any questions regarding KinD and running KinD in CI, feel free to reach out to me over [GitHub Issues](https://github.com/xmudrii/travis-kind/issues), [Kubernetes Slack](http://slack.k8s.io/) (`@xmudrii`) or [Twitter](https://twitter.com/xmudrii).
