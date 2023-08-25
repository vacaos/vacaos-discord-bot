FROM gradle:8.3.0-jdk17-alpine as build

WORKDIR /vacaos
COPY . .
RUN gradle clean jar

FROM eclipse-temurin:17-jdk-alpine

COPY --from=build /vacaos/app/build/libs/*.jar /app.jar
CMD ["java", "-jar", "/app.jar"]