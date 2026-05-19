# Library System Docker Deployment

Docker Compose infrastructure for the `library-api` ecosystem.

This repository contains the complete containerized deployment stack for the project, including the REST API, Kafka infrastructure, notification microservice, MySQL databases and Nginx reverse proxy with HTTPS support.

---

## Infrastructure overview

Current architecture:

```text
Client
   ↓
Nginx (HTTPS reverse proxy)
   ↓
library-api
   ↓
Apache Kafka
   ↓
notification-service
```

The infrastructure is fully containerized using Docker Compose.

---

## Included services

### Reverse proxy

- Nginx
- HTTPS enabled using self-signed SSL certificates
- Reverse proxy for `library-api`

### Main API

- Spring Boot REST API
- JWT authentication and authorization
- Apache Kafka producer integration
- Independent MySQL database

Repository:
- `libraryapi`

### Notification microservice

- Apache Kafka consumer
- Asynchronous event processing
- Notification log persistence
- Independent MySQL database

Repository:
- `notification-service`

### Messaging infrastructure

- Apache Kafka
- Apache ZooKeeper

### Databases

- MySQL 8 for `library-api`
- MySQL 8 for `notification-service`

---

## Tech stack

- Docker Compose
- Docker
- Nginx
- HTTPS / SSL
- Apache Kafka
- Apache ZooKeeper
- MySQL 8
- Java 21
- Spring Boot

---

## Repository structure

```text
deploy/
├── docker-compose.yml
├── .env.example
├── java_api/
│   ├── Dockerfile
│   └── jar/
├── java_microservice/
│   ├── Dockerfile
│   └── jar/
├── mysql/
│   └── init/
│       ├── 01-library-db.sql
│       └── 02-notification-db.sql
└── nginx/
    ├── Dockerfile
    ├── nginx.conf
    ├── library-api
    ├── server.crt
    └── server.key
```

---

## Environment configuration

Create a `.env` file based on:

```text
.env.example
```

The file contains:
- database credentials
- JDBC URLs
- Kafka configuration
- JWT secret

⚠️ Real credentials and certificates are ignored by Git.

---

## Local deployment

Build and start the infrastructure:

```bash
docker compose up --build
```

Stop the infrastructure:

```bash
docker compose down
```

---

## End-to-end workflow

Validated workflow:

```text
Client request
    ↓
Nginx HTTPS reverse proxy
    ↓
library-api
    ↓
Kafka event publishing
    ↓
notification-service
    ↓
notification_logs persistence
```

Validated features:
- JWT authentication
- Protected endpoints
- Loan creation/update/closure
- Kafka event publishing
- Kafka event consumption
- Independent database persistence
- HTTPS communication

---

## Notes

- `.jar` files are not versioned in Git
- SSL certificates are ignored by Git
- Real environment variables are not committed
- Services communicate internally through the Docker network

---

## Related repositories

- `libraryapi`
- `notification-service`

---

## Project status

✅ Fully functional local containerized deployment completed

Current infrastructure includes:
- Docker Compose orchestration
- Nginx reverse proxy
- HTTPS support
- Kafka messaging
- MySQL persistence
- Spring Boot services
- Environment-based configuration
- End-to-end validated workflow