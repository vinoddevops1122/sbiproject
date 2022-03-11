FROM alpine:3.15.0
RUN apk add openjdk8
RUN apk add mvn
RUN apk add git
ADD https://github.com/vinoddevops1122/sbiproject.git
RUN mvn clean package
WORKDIR /opt
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.76/bin/apache-tomcat-8.5.76.tar.gz .
RUN tar -xf apache-tomcat-8.5.76.tar.gz
RUN mv apache-tomcat-8.5.76 tomcat8
WORKDIR /opt/tomcat8/webapps
COPY ./target/sbiproject.war .
EXPOSE 8080
CMD ["/opt/tomcat8/bin/catalina.sh", "run"]
