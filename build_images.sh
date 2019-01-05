#!/usr/bin/env bash

# This script is based on the script jetstack/cert-manager is using to sideload images to KinD clusters:
# https://github.com/jetstack/cert-manager/blob/master/hack/ci/lib/build_images.sh

# Image repository and name
IMAGE=xmudrii/travis-kind
# Name of the KinD cluster
# By default the cluster name is `kind-1`, but the name can be changed using the `--name` flag with the `kind create cluster` command
KIND_CLUSTER_NAME="kind-1"
# Name of the KinD's container running on the host machine
# By default this name is the cluster name with the `-control-plane` suffix
KIND_CONTAINER_NAME="${KIND_CLUSTER_NAME}-control-plane"

# build_image builds Docker image on the host machine and then sideloads it to Docker running in the KinD's container.
# In order for Kubernetes to use the sideloaded image, make sure to set `imagePullPolicy` to `Never` or `IfNotPresent`.
build_image() {
   SCRIPT_ROOT=$(dirname "${BASH_SOURCE}")
   cd $SCRIPT_ROOT

   # Create a temporary directory to store generated Docker image
   TMP_DIR=$(mktemp -d)
   IMAGE_FILE=${TMP_DIR}/image.tar.gz

   # Build Docker image
   docker build -t "${IMAGE}":latest .
   # Export generated Docker image as a .tar.gz archive
   docker save "${IMAGE}" -o "${IMAGE_FILE}"
   # Copy exported archive into KinD's Docker container
   docker cp "${IMAGE_FILE}" "${KIND_CONTAINER_NAME}":/image.tar.gz
   # Import image into KinD's Docker daemon to make it accessible by Kubernetes
   docker exec "${KIND_CONTAINER_NAME}" docker load -i /image.tar.gz
}

