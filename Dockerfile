FROM tomcat

MAINTAINER naveen

RUN apt-get update && apt-get -y upgrade

WORKDIR /usr/local/tomcat

COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
COPY index.html /usr/local/tomcat/webapps/ROOT
EXPOSE 8080
---------
------
