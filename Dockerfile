FROM openjdk:8u212-b04-jdk-slim-stretch

COPY target/simpli-project1-0.1.0.jar app.jar

VOLUME /tmp

EXPOSE 8080

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]