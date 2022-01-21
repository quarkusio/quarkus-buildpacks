#!/usr/bin/env bash
set -e

DEFAULT_PREFIX=codejive/buildpacks

REPO_PREFIX=${DEFAULT_PREFIX}-quarkus
BUILDER_PREFIX=${DEFAULT_PREFIX}-builder

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
  BUILDER=${BUILDER_PREFIX}-${BUILDER_NAME}
  echo "---> Creating builder for builder ${BUILDER_NAME}"
  pack builder create ${BUILDER}:latest --config ${builder_dir}/builder.toml
  pack config trusted-builders add ${BUILDER}:latest
done
