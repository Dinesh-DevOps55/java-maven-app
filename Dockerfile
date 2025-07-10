# Use Amazon Corretto 8 with Alpine Linux
FROM amazoncorretto:8-alpine3.17-jre

# Expose port used by the application
EXPOSE 8080

# Copy the application JAR file into the container
COPY ./target/java-maven-app-*.jar /usr/app/

# Set the working directory inside the container
WORKDIR /usr/app

# Start the Java application
ENTRYPOINT ["java", "-jar", "java-maven-app-1.0-SNAPSHOT.jar"]
