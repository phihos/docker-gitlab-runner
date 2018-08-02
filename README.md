# Docker GitLab Runner

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
        
## License

Please see LICENSE
