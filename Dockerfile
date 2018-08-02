FROM gitlab/gitlab-runner:latest
MAINTAINER Philipp Hossner <philipp.hossner@posteo.de>

ADD assets/entrypoint /
RUN chmod +x /entrypoint