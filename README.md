# Docker GitLab Runner

[![Automated Build](https://img.shields.io/docker/automated/phihos/gitlab-runner.svg)](https://hub.docker.com/r/phihos/gitlab-runner/)
[![Docker Build Status](https://img.shields.io/docker/build/phihos/gitlab-runner.svg)](https://hub.docker.com/r/phihos/gitlab-runner/)

A dockerized GitLab runner that automatically registers before running.
The first time the container runs it is registered with GitLab. If the configuration file already exists this step is skipped.

## How to run

For a shell runner run

    docker run --detached \
        --name=gitlab-runner \
        --restart=always \
        -e REGISTRATION_TOKEN=XXXXXXXXXX \
        -e CI_SERVER_URL=http://gitlab.mydomain.com \
        -e RUNNER_EXECUTOR=shell \
        -e RUNNER_SHELL=bash \
        --volume=/etc/gitlab-runner:/etc/gitlab-runner
        
For a Docker runner run

    docker run --detached \
          --name=gitlab-runner \
          --restart=always \
          -e REGISTRATION_TOKEN=XXXXXXXXXX \
          -e CI_SERVER_URL=http://gitlab.mydomain.com \
          -e RUNNER_EXECUTOR=docker \
          -e DOCKER_IMAGE = "ubuntu:latest" \
          --volume=/etc/gitlab-runner:/etc/gitlab-runner \
          --volume=/var/run/docker.sock:/var/run/docker.sock
	
For a list of possible environment variables run

    docker run gitlab/gitlab-runner register --help
    
Each command line options has a corresponding environment variable that can be set.
Currently the *RUNNER_ENV* variable does not allow multiple values (see below).
		  
## RUNNER_ENV workaround

Currently it is [not possible](https://gitlab.com/gitlab-org/gitlab-runner/issues/259) to specify multiple environment variables via *RUNNER_ENV*.
As a workaround you can specify *RUNNER_ENV_1, RUNNER_ENV_2, ..., RUNNER_ENV_256*. This fix was taken from [here](https://gitlab.com/gitlab-org/gitlab-runner/issues/259#note_41453202).
        
## License

Please see LICENSE
