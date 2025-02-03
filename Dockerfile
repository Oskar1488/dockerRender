# Stage 1: Build the application
FROM eclipse-temurin:23-jdk AS builder
# Set the working directory
WORKDIR /app
# Copy the application code
COPY . .
# Given permissions to mvnw
RUN chmod +x mvnw
# Build the application (requires Maven or Gradle)
RUN ./mvnw clean package
# Stage 2: Run the application
FROM eclipse-temurin:23-jre
# Set the working directory
WORKDIR /app
# Copy the JAR file from the builder stage
COPY --from=builder /app/target/*.jar app.jar
# Expose the port the app will run on
EXPOSE 8080
# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

#docker build -t nombredelaimagen .
#docker run -d -p 8080:8080 nombredelaimagen .
