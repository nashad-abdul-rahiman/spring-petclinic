# syntax=docker/dockerfile:1

FROM maven:3.9.3-eclipse-temurin-17
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY src ./src
RUN ./mvnw dependency:resolve
CMD ["./mvnw", "spring-boot:run"]
