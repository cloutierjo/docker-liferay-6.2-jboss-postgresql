#!/bin/bash

# General Updates
apt-get update

# Install utils
apt-get install -y vim nano emacs

# Install JDK from /assets/packages/
tar -zxvf /assets/packages/jdk* -C /opt/ &&
ln -s /opt/jdk* /opt/jdk &&
echo "export JAVA_HOME=/opt/jdk" >> /root/.bashrc &&
echo "export PATH=$PATH:/opt/jdk/bin" >> /root/.bashrc &&
set JAVA_HOME=/opt/jdk &&
set PATH=$PATH:/opt/jdk/bin &&
set JBOSS_HOME=/opt/liferay/jboss

# Install Liferay from /assets/packages/
apt-get install -y unzip &&
unzip /assets/packages/liferay* -d /opt/ &&
ln -s /opt/liferay* /opt/liferay &&
ln -s /opt/liferay/jboss* /opt/liferay/jboss &&

# Configure Liferay
mkdir /opt/liferay/deploy && 
cp /assets/packages/license* /opt/liferay/deploy/ &&
cp /assets/conf/liferay/portal-ext.properties /opt/liferay/ &&
cp -R /assets/conf/liferay/data/* opt/liferay/data/ &&
cp -R /assets/conf/liferay/jboss/* /opt/liferay/jboss/ &&

# Cleaning /assets/packages
rm -rf /assets &&

# Exit
exit $?
