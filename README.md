# Docker GitLab Runner

![Automated Build](https://img.shields.io/docker/automated/phihos/gitlab-runner.svg)
![Build Status](https://img.shields.io/docker/build/phihos/gitlab-runner.svg)

A dockerized GitLab runner that automatically registers before running.
The first time the container runs it is registered with GitLab. If the configuration file already exists this step is skipped.

## How to run

For a shell runner run

    docker run --detached \
        --name=gitlab-runner
        --restart=always \
        --environment REGISTRATION_TOKEN=XXXXXXXXXX \
        --environment CI_SERVER_URL=http://gitlab.mydomain.com \
        --environment RUNNER_EXECUTOR=shell \
        --environment RUNNER_SHELL=bash \
        --volume=/etc/gitlab-runner:/etc/gitlab-runner
        
For a Docker runner run

    docker run --detached \
          --name=gitlab-runner
          --restart=always \
          --environment REGISTRATION_TOKEN=XXXXXXXXXX \
          --environment CI_SERVER_URL=http://gitlab.mydomain.com \
          --environment RUNNER_EXECUTOR=docker \
          --environment DOCKER_IMAGE = "ubuntu:latest"
          --volume=/etc/gitlab-runner:/etc/gitlab-runner
          --volume=/var/run/docker.sock:/var/run/docker.sock
		  
## RUNNER_ENV workaround

Currently it is [not possible](https://gitlab.com/gitlab-org/gitlab-runner/issues/259) to specify multiple environment variables via *RUNNER_ENV*.
As a workaround you can specify *RUNNER_ENV_1, RUNNER_ENV_2, ..., RUNNER_ENV_256*. This fix was taken from [here](https://gitlab.com/gitlab-org/gitlab-runner/issues/259#note_41453202).
        
## License

Please see LICENSE
