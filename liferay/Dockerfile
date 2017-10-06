FROM ubuntu:14.04.3
MAINTAINER Ivan K.

ADD assets /assets
RUN /assets/conf/setup.sh

ENV JAVA_HOME=/opt/jdk \
    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/jdk/bin \
    JBOSS_HOME=/opt/liferay/jboss

USER root

EXPOSE 8080
EXPOSE 8787

# run patch update

CMD rm -rf /opt/liferay/jboss/standalone/configuration/standalone_xml_history/current && /opt/liferay/jboss/bin/standalone.sh -b 0.0.0.0
