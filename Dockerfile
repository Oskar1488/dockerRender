# Etapa 1: Build (Compilación)
FROM eclipse-temurin:23-jdk AS builder
WORKDIR /app

# Copiar solo archivos esenciales para optimizar la caché de Docker
COPY pom.xml .
RUN mvn dependency:go-offline

# Ahora copiamos el resto del código fuente
COPY . .

# Construir la aplicación (sin ejecutar tests)
RUN mvn clean package -DskipTests

# Etapa 2: Runtime (Ejecución)
FROM eclipse-temurin:23-jdk AS builder
WORKDIR /app

# Copiar el JAR desde el builder
COPY --from=builder /app/target/*.jar app.jar

# Exponer el puerto de la aplicación
EXPOSE 8080

# Ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]


