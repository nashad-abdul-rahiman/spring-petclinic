# syntax=docker/dockerfile:1
#Stage 1
FROM maven:3.9.3-eclipse-temurin-17
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
#RUN ./mvnw dependency:resolve
COPY src ./src
RUN ./mvnw package

#Stage 2
# set base image for second stage
FROM eclipse-temurin:17.0.8_7-jdk-jammy
# set deployment directory
WORKDIR /app
# copy over the built artifact from the maven image
COPY --from=stage1 /app/target/spring-petclinic-3.1.0-SNAPSHOT.jar /app
EXPOSE 8080
ENTRYPOINT ["java","-jar","spring-petclinic-3.1.0-SNAPSHOT.jar"]
