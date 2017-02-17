FROM gitlab/gitlab-runner:v1.10.4

RUN apt-get update && apt-get install -yqq --no-install-recommends \
    curl \
    && apt-get clean autoclean && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

ENV DOCKER_VERSION 1.13.1

RUN curl -fsSL \
    "https://get.docker.com/builds/$(uname -s)/$(uname -m)/docker-${DOCKER_VERSION}.tgz" | tar xz > docker \
    && mv docker/docker /usr/local/bin/docker \
    && rm -rf docker
# Install docker-compose
ENV DOCKER_COMPOSE_VERSION 1.10.1
RUN curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

COPY *.sh /
COPY config.toml /etc/gitlab-runner/
ENTRYPOINT /bootstrap.sh
