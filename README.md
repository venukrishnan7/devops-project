# 🚀 DevOps Distributed Task Manager

## 📖 Project Overview
This project is a fully containerized, microservices-based Task Management application designed to demonstrate modern DevOps practices. The infrastructure is provisioned as code, and the application components are orchestrated for high availability.

## 🏗️ Architecture & Tech Stack
* **Frontend:** Vanilla HTML/CSS/JS (Modern Dashboard UI)
* **Backend Microservices:** Node.js / Express (Task Service & User Service)
* **Containerization:** Docker
* **Orchestration:** Kubernetes (Local Deployment)
* **Infrastructure as Code (IaC):** Terraform
* **CI/CD:** GitHub Actions (Automated Build & Test Pipeline)

## ⚙️ Features
* **Microservices Communication:** The frontend dynamically fetches data from independent Task and User API services via RESTful endpoints.
* **Infrastructure Automation:** Terraform completely automates the creation of Kubernetes Deployments and NodePort Services.
* **CORS Configured:** Secure cross-origin resource sharing implemented across services.
* **Version Control:** Strict Git workflow utilizing branching, committing, and Pull Requests.