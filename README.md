# Quarkus Buildpacks

This are some WIP build stacks for building Quarkus applications using supported images like Red Hat OpenJDK and Red Hat Quarkus builder (Mandrel).

To use buildpacks you'll need `pack`, see the instructions here on how to install it:

https://buildpacks.io/docs/tools/pack/


## Installation

To install the build packs run clone this repo and run the `create-buildpacks.sh` script.


## Quarkus JVM

To test the buildpack for [Quarkus](https://quarkus.io) using the JVM run this:

```
pack build quarkus-jvm-test-app --path apps/quarkus-sample-app --builder redhat/buildpacks-builder-quarkus-jvm:latest
```

## Quarkus Native

To test the buildpack for [Quarkus](https://quarkus.io) compiling to native code run this:

```
pack build quarkus-native-test-app --path apps/quarkus-sample-app --builder redhat/buildpacks-builder-quarkus-native:latest
```

## Running

After having built the image with one of the commands above you can simply run them, eg:

```
docker run -it --rm quarkus-jvm-test-app
```

or

```
docker run -it --rm quarkus-native-test-app
```

## Development

The information for creating buildpacks comes from:

https://buildpacks.io/docs/buildpack-author-guide/create-buildpack/
