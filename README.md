# Quarkus Buildpacks

This are some WIP build stacks for building Quarkus applications using supported images like Red Hat OpenJDK and Red Hat Quarkus builder (Mandrel).

To use buildpacks you'll need `pack`, see the instructions here on how to install it:

https://buildpacks.io/docs/tools/pack/


## Installation

To install the build packs run clone this repo and run the `create-buildpacks.sh` script.


## Quarkus JVM

To test the buildpack for [Quarkus](https://quarkus.io) run this:

```
pack build quarkus-jvm-test-app --path apps/quarkus-sample-app --builder redhat/quarkus-jvm-builder:latest --buildpack "io.quarkus.jvm.buildpack@0.0.1"
```

## Quarkus Native

Not implemented yet. 

## Running

After having built the image with one of the commands above you can simply run them, eg:

```
docker run -it --rm quarkus-jvm-test-app
```

## Development

The information for creating buildpacks comes from:

https://buildpacks.io/docs/buildpack-author-guide/create-buildpack/
