FROM jenkins/jenkins:lts-alpine

USER root
RUN apk add --no-cache docker py-pip && pip install awscli
RUN pip install --upgrade pip

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# in order to allow access to /var/run/docker.sock from host
USER root
