# Buildpacks

Just some buildpacks I'm working on.

To use buildpacks you'll need `pack`, see the instructions here on how to install it:

https://buildpacks.io/docs/tools/pack/

## Jbang

To test the buildpack for [Jbang](https://jbang.dev) run this:

```
pack build jbang-test-app --path ./jbang-sample-app --buildpack ./jbang-buildpack --builder cnbs/sample-builder:bionic
```

## Quarkus

To test the buildpack for [Quarkus](https://quarkus.io) run this:

```
pack build quarkus-test-app --path ./quarkus-sample-app --buildpack ./quarkus-buildpack --builder cnbs/sample-builder:bionic
```

## Running

After having built the image with one of the commands above you can simply run them, eg:

```
docker run -ti --rm jbang-test-app
```

## Development

The information for creating buildpacks comes from:

https://buildpacks.io/docs/buildpack-author-guide/create-buildpack/
