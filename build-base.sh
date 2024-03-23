#!/usr/bin/env bash

set -eo pipefail

docker run \
  --rm \
  -v ${PWD}:/work \
  -w /work \
  cgr.dev/chainguard/apko \
  build \
  wolfi-base.yaml ghcr.io/m-arcus/php-rector:base base.tar

docker load < base.tar

rm -f base.tar sbom*

docker push ghcr.io/m-arcus/php-rector:base-amd64
docker push ghcr.io/m-arcus/php-rector:base-arm64

docker manifest create ghcr.io/m-arcus/php-rector:base --amend ghcr.io/m-arcus/php-rector:base-amd64 --amend ghcr.io/m-arcus/php-rector:base-arm64

docker manifest push ghcr.io/m-arcus/php-rector:base
