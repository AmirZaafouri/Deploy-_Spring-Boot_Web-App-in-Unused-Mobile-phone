# 🏗️ Stage 1: Build the Spring Boot JAR using Maven
FROM maven:3.8.6-openjdk-8 AS build
# Copy the project files || The last dot (.) represents the destination directory inside the Docker container.
COPY pom.xml .
COPY src ./src

# Build the JAR
RUN mvn clean package -DskipTests

# 🚀 Stage 2: Run the Spring Boot application
FROM openjdk:8-jdk-alpine

# Copy only the JAR from the build stage
COPY --from=build /target/*.jar gestion-station-ski-1.0.jar

# Expose port 8088
EXPOSE 8088

# Run the application
ENTRYPOINT ["java", "-jar", "/gestion-station-ski-1.0.jar"]
