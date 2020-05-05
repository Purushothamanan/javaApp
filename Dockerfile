FROM tomcat:8.0.20-jre8

COPY tomcat-users.xml /usr/local/tomcat/conf
COPY SampleApp-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/myapp.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
