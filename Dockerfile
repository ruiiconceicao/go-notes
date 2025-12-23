FROM golang:1.24-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o go-notes-app .

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/go-notes-app .

RUN apk add --no-cache bash

EXPOSE 8080

CMD ["./go-notes-app"]

