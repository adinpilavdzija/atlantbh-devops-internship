# Stage 1
FROM maven:3.8.5-openjdk-17-slim as builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:resolve
COPY src ./src
RUN mvn clean package

# Stage 2
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
EXPOSE 9966
COPY --from=builder /app/target/spring-petclinic-rest-3.0.2.jar app.jar
CMD ["java", "-jar", "app.jar"]