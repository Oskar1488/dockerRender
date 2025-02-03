# Etapa 1: Build (Compilación)
FROM openjdk:23 AS builder
WORKDIR /app

# Instalar Maven manualmente
RUN apt-get update && apt-get install -y maven

# Copiar solo archivos esenciales para optimizar la caché de Docker
COPY pom.xml .
RUN mvn dependency:go-offline

# Ahora copiamos el resto del código fuente
COPY . .

# Construir la aplicación (sin ejecutar tests)
RUN mvn clean package -DskipTests

# Etapa 2: Runtime (Ejecución)
FROM openjdk:23
WORKDIR /app

# Copiar el JAR desde la etapa de construcción
COPY --from=builder /app/target/*.jar app.jar

# Exponer el puerto de la aplicación
EXPOSE 8080

# Ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
