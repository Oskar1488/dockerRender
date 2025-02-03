# Etapa 1: Build (Compilación)
FROM maven:3.9.6-eclipse-temurin-23 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Etapa 2: Runtime (Ejecución)
FROM eclipse-temurin:23-jre
WORKDIR /app

# Copiar solo el JAR generado en la etapa de compilación
COPY --from=builder /app/target/*.jar app.jar

# Exponer el puerto 8080
EXPOSE 8080

# Ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]



