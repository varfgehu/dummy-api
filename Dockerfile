#
# Build stage
#
FROM eclipse-temurin:17-jdk-jammy AS build
ENV HOME=/usr/app
RUN mkdir -p $HOME
WORKDIR $HOME
ADD . $HOME
RUN --mount=type=cache,target=/root/.m2 ./mvnw -f $HOME/pom.xml clean package

FROM openjdk:17-jdk-slim

WORKDIR /app

COPY --from=build /project/target/dummy-api-0.0.1-SNAPSHOT.jar ./

CMD ["java", "-jar", "./dummy-api-0.0.1-SNAPSHOT.jar"]