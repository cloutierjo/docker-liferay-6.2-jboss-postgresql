## Docker image for Liferay v6.x bundeled with Jboss and PostgreSQL 9.5

The project will build a docker image with up and running Liferay 6.x distribution. The image include :

* PostgreSQL 9.5 database

* JDK installation from provided tar.gz  

* Liferay installation from provided Liferay-portal-jboss-6.x bundle zip archive

**Note :** The docker image should not be used in production environment.

## Required Customization

Before running the docker builder, you need to provide following packages in ./assets/packages/ folder :

* Oracle JDK archive : jdk-7uXX-linux-x64.tar.gz

* Official Liferay Poratal 6.x jboss bundle .zip archive : liferay-portal-jboss-6.x<...>.zip

* Liferay license .xml file : license<...>.xml

Added to those packages, you may need to create a "/opt/liferay/docker" folder to be able to link a host deploy folder to the one in the container (used in the docker run command below)

## Build & Run & Start

From project root folder :

    docker build -t docker-liferay-6.2-jboss-postgresql .
    JOB=$(docker run -d -v /opt/liferay/docker/deploy:/opt/liferay/deploy -p 50022:22 -p 55432:5432 -p 58080:8080 -p 58787:8787 -p51234:1234 --name docker-liferay-6.2-jboss-postgresql docker-liferay-6.2-jboss-postgresql)
    docker start $JOB

Note :

    Arbitrary image and container name : docker-liferay-6.2-jboss-postgresql
    Arbitrary port mapping :
        port 22 is mapped to 50022 (ssh)
        port 5432 is mapped to 55432 (postgresql)
        port 8080 is mapped to 58080 (jboss)
        port 8787 is mapped to 58787 (jboss debug port)
        port 1234 is mapped to 51234 (jrebel remote port)   

## Accounts :

System account :

    user : root
    pwd : admin

Database accounts :

    PostgreSQL administration :
        user : docker
        pwd : docker

    Liferay Database : lportal
        user : lportal
        pwd : lportal

## Access to Liferay Portal :

Open **http://localhost:58080** in the browser of your choice and finish portal initialization.

**Note :** Please note that the first Liferay startup can take up to few minutes.
