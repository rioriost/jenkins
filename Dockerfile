FROM jenkins/jenkins:lts

# Setting the number of executors to 0
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

# Preinstalling plugins
COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/install-plugins.sh $(cat /usr/share/jenkins/ref/plugins.txt)

USER root

RUN apt-get update
RUN apt-get install -y net-tools

USER ${user}
