#!/bin/bash
set -e

echo "🚀 Setting up multi-cloud CI/CD project structure..."

# Create folders
mkdir -p app/python/src app/python/tests
mkdir -p app/java/src app/java/tests
mkdir -p app/go/src app/go/tests

mkdir -p infra/gcp infra/aws infra/azure
mkdir -p deploy/k8s deploy/helm/templates deploy/scripts
mkdir -p .github/workflows

# --- Python App ---
cat > app/python/src/main.py <<EOL
def hello():
    return "Hello from Python!"

if __name__ == "__main__":
    print(hello())
EOL

cat > app/python/tests/test_main.py <<EOL
from src.main import hello

def test_hello():
    assert hello() == "Hello from Python!"
EOL

cat > app/python/Dockerfile <<EOL
FROM python:3.12-slim
WORKDIR /app
COPY src/ ./src/
CMD ["python", "src/main.py"]
EOL

cat > app/python/requirements.txt <<EOL
# Add dependencies here
EOL

# --- Java App ---
cat > app/java/src/Main.java <<EOL
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello from Java!");
    }
}
EOL

cat > app/java/Dockerfile <<EOL
FROM openjdk:20-slim
WORKDIR /app
COPY src/ ./src/
RUN javac src/Main.java
CMD ["java", "-cp", "src", "Main"]
EOL

# --- Go App ---
cat > app/go/src/main.go <<EOL
package main
import "fmt"

func main() {
    fmt.Println("Hello from Go!")
}
EOL

cat > app/go/Dockerfile <<EOL
FROM golang:1.22-alpine
WORKDIR /app
COPY src/ ./src/
RUN go build -o app src/main.go
CMD ["./app"]
EOL

# --- Infra placeholders ---
for cloud in gcp aws azure; do
    touch infra/$cloud/main.tf
    touch infra/$cloud/other.tf
done

# --- Deploy placeholders ---
touch deploy/k8s/deployment.yaml
touch deploy/helm/Chart.yaml
touch deploy/helm/values.yaml
touch deploy/scripts/deploy.sh

# --- GitHub workflows placeholder ---
touch .github/workflows/ci.yml

echo "✅ Project scaffold created successfully!"
