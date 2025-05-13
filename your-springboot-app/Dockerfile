FROM tomcat:9.0.104
#tomcat 104 jdk 11

RUN apt-get update && apt-get install -y netcat-traditional

RUN rm -rf /usr/local/tomcat/webapps/*

COPY demo-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/demo.war

COPY wait-for-postgres.sh wait-for-postgres.sh
RUN chmod +x wait-for-postgres.sh

# Exponer puerto
EXPOSE 8080

CMD ["catalina.sh", "run"]

