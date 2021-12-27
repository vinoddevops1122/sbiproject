FROM centos:latest
RUN yum install java-1.8.0-openjdk -y
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.73/bin/apache-tomcat-8.5.73.tar.gz .
RUN tar -xvzf apache-tomcat-8.5.73.tar.gz
RUN mv apache-tomcat-8.5.73/* /opt/tomcat
EXPOSE 8080
COPY ./target/sbiproject.war /opt/tomcat/webapps
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
