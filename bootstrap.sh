#!/bin/bash

export CI_USER=gitlab-runner
/set-docker-group.sh
if [[ ! -f /etc/gitlab-runner/registered ]]; then
touch /etc/gitlab-runner/registered
register_cmd="/usr/bin/gitlab-runner register \
  -n \
  -r ${TOKEN} \
  -name ${NAME} \
  -u ${URL} \
  --executor ${EXECUTOR} \
  --docker-image ${BASE_IMAGE} \
  --env ${ENV_VARS//' '/' --env '} \
  --docker-privileged true"
$register_cmd
fi
/usr/bin/gitlab-runner --debug run --user=${CI_USER} --working-directory=/home/${CI_USER}
