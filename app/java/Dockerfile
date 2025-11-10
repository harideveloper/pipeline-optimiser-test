FROM openjdk:20-slim
WORKDIR /app
COPY src/ ./src/
RUN javac src/Main.java
CMD ["java", "-cp", "src", "Main"]
