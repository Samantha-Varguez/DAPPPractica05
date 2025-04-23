FROM tomcat:9.0

# Remove the default web apps
RUN apt-get update && apt-get install -y netcat-traditional

RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR into the Tomcat webapps directory
COPY demo-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/demo.war

COPY wait-for-postgres.sh wait-for-postgres.sh
RUN chmod +x wait-for-postgres.sh

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

