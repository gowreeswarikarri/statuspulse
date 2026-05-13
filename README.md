# StatusPulse DevOps Project

## Live URLs

Production API:
https://54.158.88.185.nip.io

Swagger Docs:
https://54.158.88.185.nip.io/docs

Health Check:
https://54.158.88.185.nip.io/health

Monitoring Dashboard:
http://54.158.88.185:3001

Public Status Page:
http://54.158.88.185:3001/status/statuspulse

---

## Features

- Dockerized FastAPI application
- PostgreSQL and Redis integration
- Docker Compose setup
- GitHub Actions CI/CD pipeline
- Automated deployment to AWS EC2
- HTTPS enabled using Caddy
- Uptime Kuma monitoring
- Discord alert notifications
- Health checks and integration tests
- Firewall and SSH hardening

---

## Tech Stack

- FastAPI
- PostgreSQL
- Redis
- Docker
- Docker Compose
- GitHub Actions
- AWS EC2
- Caddy
- Uptime Kuma
- Discord Webhooks

---

## Local Run

```bash
make build
make up
make test
