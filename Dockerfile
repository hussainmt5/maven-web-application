FROM tomcat
MAINTAINER teja
COPY target/*.war /usr/local/tomcat/webapps/mvn-web-app
