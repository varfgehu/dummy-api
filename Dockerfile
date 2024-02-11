FROM maven:3.8-jdk-11 AS build

WORKDIR /project

COPY ./ /project

RUN mvn clean package

FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

COPY --from=build /project/target/dummy-api-0.0.1-SNAPSHOT.jar ./

CMD ["java", "-jar", "./dummy-api-0.0.1-SNAPSHOT.jar"]