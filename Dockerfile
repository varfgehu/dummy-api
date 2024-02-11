FROM maven:3.8-jdk-17 AS build

WORKDIR /project

COPY ./ /project

RUN mvn clean package

FROM openjdk-17

WORKDIR /app

COPY --from=build /project/target/dummy-api-0.0.1-SNAPSHOT.jar ./

CMD ["java", "-jar", "./dummy-api-0.0.1-SNAPSHOT.jar"]