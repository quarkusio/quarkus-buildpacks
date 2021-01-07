#!/usr/bin/env bash
set -e

ID_PREFIX="io.buildpacks.quarkus"

DEFAULT_PREFIX=redhat/quarkus-stack

REPO_PREFIX=${DEFAULT_PREFIX}

DIR=$(cd $(dirname $0) && pwd)
STACKS_DIR=$DIR/stacks
BUILDERS_DIR=$DIR/builders
BUILDPACKS_DIR=$DIR/buildpacks

echo "---> Building Stacks"

for stack_dir in $(find ${STACKS_DIR} -maxdepth 1 -mindepth 1 -type d)
do
  echo "---> Building Stack $(basename ${stack_dir})"
  $DIR/stacks/build-stack.sh -p ${REPO_PREFIX} ${stack_dir}
done

for builder_dir in $(find ${BUILDERS_DIR} -maxdepth 1 -mindepth 1 -type d)
do
  echo "---> Creating builder for builder $(basename ${builder_dir})"
  pack create-builder redhat/$(basename ${builder_dir}):latest --config ${builder_dir}/builder.toml
  pack trust-builder redhat/$(basename ${builder_dir}):latest
done

