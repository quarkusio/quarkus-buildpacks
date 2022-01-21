#!/bin/bash

TAG=$1
if [[ "$TAG" == "" ]]; then
    echo "Missing tag name"
    exit
fi

COMMIT=$(git rev-parse --short $TAG)

docker tag codejive/buildpacks-quarkus-build:jvm codejive/buildpacks-quarkus-build:${COMMIT}-jvm
docker tag codejive/buildpacks-quarkus-run:jvm codejive/buildpacks-quarkus-run:${COMMIT}-jvm
docker tag codejive/buildpacks-quarkus-builder:jvm codejive/buildpacks-quarkus-builder:${COMMIT}-jvm

docker tag codejive/buildpacks-quarkus-build:native codejive/buildpacks-quarkus-build:${COMMIT}-native
docker tag codejive/buildpacks-quarkus-run:native codejive/buildpacks-quarkus-run:${COMMIT}-native
docker tag codejive/buildpacks-quarkus-builder:native codejive/buildpacks-quarkus-builder:${COMMIT}-native

docker push codejive/buildpacks-quarkus-build:${COMMIT}-jvm
docker push codejive/buildpacks-quarkus-run:${COMMIT}-jvm
docker push codejive/buildpacks-quarkus-builder:${COMMIT}-jvm

docker push codejive/buildpacks-quarkus-build:${COMMIT}-native
docker push codejive/buildpacks-quarkus-run:${COMMIT}-native
docker push codejive/buildpacks-quarkus-builder:${COMMIT}-native

if [[ "$TAG" != "HEAD" ]]; then
    docker tag codejive/buildpacks-quarkus-build:jvm codejive/buildpacks-quarkus-build:${TAG}-jvm
    docker tag codejive/buildpacks-quarkus-run:jvm codejive/buildpacks-quarkus-run:${TAG}-jvm
    docker tag codejive/buildpacks-quarkus-builder:jvm codejive/buildpacks-quarkus-builder:${TAG}-jvm

    docker tag codejive/buildpacks-quarkus-build:native codejive/buildpacks-quarkus-build:${TAG}-native
    docker tag codejive/buildpacks-quarkus-run:native codejive/buildpacks-quarkus-run:${TAG}-native
    docker tag codejive/buildpacks-quarkus-builder:native codejive/buildpacks-quarkus-builder:${TAG}-native

    docker push codejive/buildpacks-quarkus-build:${TAG}-jvm
    docker push codejive/buildpacks-quarkus-run:${TAG}-jvm
    docker push codejive/buildpacks-quarkus-builder:${TAG}-jvm

    docker push codejive/buildpacks-quarkus-build:${TAG}-native
    docker push codejive/buildpacks-quarkus-run:${TAG}-native
    docker push codejive/buildpacks-quarkus-builder:${TAG}-native

    docker push codejive/buildpacks-quarkus-build:jvm
    docker push codejive/buildpacks-quarkus-run:jvm
    docker push codejive/buildpacks-quarkus-builder:jvm

    docker push codejive/buildpacks-quarkus-build:native
    docker push codejive/buildpacks-quarkus-run:native
    docker push codejive/buildpacks-quarkus-builder:native

    docker tag codejive/buildpacks-quarkus-builder:native codejive/buildpacks-quarkus-builder:latest
    docker push codejive/buildpacks-quarkus-builder:latest
fi

