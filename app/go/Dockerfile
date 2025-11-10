FROM golang:1.22-alpine
WORKDIR /app
COPY src/ ./src/
RUN go build -o app src/main.go
CMD ["./app"]
