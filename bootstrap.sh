#!/bin/bash

export CI_USER=gitlab-runner
/set-docker-group.sh
if [[ ! -f /etc/gitlab-runner/config/config.toml ]]; then /usr/bin/gitlab-runner register; fi
/usr/bin/gitlab-runner --debug run --user=${CI_USER} --working-directory=/home/${CI_USER}
