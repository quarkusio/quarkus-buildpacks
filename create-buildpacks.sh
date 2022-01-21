#!/usr/bin/env bash
set -e

DEFAULT_PREFIX=codejive/buildpacks

REPO_PREFIX=${DEFAULT_PREFIX}-quarkus

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
  BUILDER_NAME=$(basename ${builder_dir})
  for builder_tag_dir in $(find ${builder_dir} -maxdepth 1 -mindepth 1 -type d)
  do
    BUILDER_TAG=$(basename ${builder_tag_dir})
    BUILDER=${DEFAULT_PREFIX}-${BUILDER_NAME}-builder:${BUILDER_TAG}
    echo "---> Creating builder for builder ${BUILDER}"
    pack builder create ${BUILDER} --config ${builder_tag_dir}/builder.toml
    pack config trusted-builders add ${BUILDER}
  done
done
