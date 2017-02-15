#!/bin/bash -x

# this only works if the docker group does not already exist
# see https://github.com/jenkinsci/docker/issues/196#issuecomment-179486312

DOCKER_SOCKET=/var/run/docker.sock
DOCKER_GROUP=docker

if [ -S ${DOCKER_SOCKET} ]; then
    DOCKER_GID=$(stat -c '%g' ${DOCKER_SOCKET})
    groupadd -for -g ${DOCKER_GID} ${DOCKER_GROUP}
    usermod -aG ${DOCKER_GROUP} ${CI_USER}
fi
