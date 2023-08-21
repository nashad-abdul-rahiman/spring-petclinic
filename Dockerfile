FROM eclipse-temurin:11-jdk-jammy
WORKDIR app
COPY target/*.jar .
EXPOSE 8080
ENTRYPOINT ["java","-jar","spring-petclinic-3.1.0-SNAPSHOT.jar"]
