#FROM openjdk:11
#VOLUME /tmp
#EXPOSE 8080
#ADD target/spring-hr-management-app.jar spring-hr-management-app.jar
#ENTRYPOINT ["java", "-jar", "spring-hr-management-app.jar"]
FROM eclipse-temurin:17-jdk

VOLUME /tmp

EXPOSE 8080

COPY target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]
