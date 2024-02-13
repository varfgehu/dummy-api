## Use an official Maven image as the base image
#FROM eclipse-temurin:17-jdk-alpine AS build
## Set the working directory in the container
#WORKDIR /app
## Copy the pom.xml and the project files to the container
#COPY pom.xml .
#COPY src ./src
## Build the application using Maven
#RUN mvn clean package -DskipTests
# Use an official OpenJDK image as the base image
#FROM openjdk:17-alpine AS run
## Set the working directory in the container
#WORKDIR /app
## Copy the built JAR file from the previous stage to the container
#COPY /app/target/dummy-api.jar .
## Set the command to run the application
#CMD ["java", "-jar", "dummy-api.jar"]

FROM openjdk:17-jdk-slim
COPY target/*.jar dummy-api.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/dummy-api.jar"]