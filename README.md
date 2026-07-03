# 🌍 Multi-Cloud Banking Platform

> A production-style Multi-Cloud Banking Application deployed across **AWS** and **Microsoft Azure** using **Terraform**, **Docker**, **Amazon EKS**, **Kubernetes**, and a **Site-to-Site IPSec VPN**.

![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?style=for-the-badge&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?style=for-the-badge&logo=amazonaws)
![Azure](https://img.shields.io/badge/Azure-Cloud-0078D4?style=for-the-badge&logo=microsoftazure)
![Kubernetes](https://img.shields.io/badge/Kubernetes-EKS-326CE5?style=for-the-badge&logo=kubernetes)
![Docker](https://img.shields.io/badge/Docker-Containers-2496ED?style=for-the-badge&logo=docker)
![NodeJS](https://img.shields.io/badge/Node.js-Backend-339933?style=for-the-badge&logo=node.js)
![React](https://img.shields.io/badge/React-Frontend-61DAFB?style=for-the-badge&logo=react)

---

# 📖 Project Overview

This project demonstrates how a modern application can be deployed across multiple cloud providers while maintaining secure communication between resources.

The application is a **Three-Tier Banking Application** where:

- Frontend is deployed on **Amazon EKS**
- Backend API is deployed on **Amazon EKS**
- Database tier is designed to be hosted inside an **Azure Virtual Network**
- AWS and Azure communicate through a secure **Site-to-Site IPSec VPN**

The main objective of this project was to gain hands-on experience building secure **multi-cloud infrastructure**, implementing **Infrastructure as Code**, and understanding how enterprise applications communicate across different cloud platforms.

---

# 🎯 Project Objectives

- Build infrastructure using Terraform
- Deploy a Kubernetes cluster on AWS
- Containerize applications using Docker
- Store container images in Amazon ECR
- Deploy applications into Amazon EKS
- Implement Kubernetes networking
- Secure communication using Site-to-Site VPN
- Connect AWS resources securely to Azure resources
- Understand enterprise multi-cloud networking

---

# 🏗️ Architecture

> **Architecture Diagram**

Replace this section with your architecture image.

```text
Users
   │
   ▼
AWS Load Balancer
   │
   ▼
NGINX Ingress Controller
   │
   ▼
Amazon EKS Cluster
 ├──────────────┐
 │              │
 ▼              ▼
Frontend      Backend
 │              │
 └────ClusterIP─┘
        │
        ▼
Site-to-Site IPSec VPN
        │
        ▼
Azure Virtual Network
        │
        ▼
Azure Database Layer
```

---

# 🎥 Architecture Walkthrough

Upload the architecture video to GitHub and include the link here.

```
Architecture Video:
https://github.com/<your-username>/<repo>/assets/xxxxxxxx
```

---

# ☁️ AWS Infrastructure

The AWS environment was provisioned using **Terraform**.

Resources created include:

- VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- Route Tables
- Security Groups
- Amazon ECR
- Amazon EKS
- IAM Roles
- Load Balancer
- Route53 (optional)
- VPN Gateway

Terraform remote state is stored in:

- Amazon S3 Bucket
- DynamoDB State Lock Table

---

# ☁️ Azure Infrastructure

Resources created in Azure include:

- Resource Group
- Virtual Network
- Database Subnet
- Gateway Subnet
- Azure VPN Gateway
- Local Network Gateway
- VPN Connection

---

# 🔐 Multi-Cloud Connectivity

One of the major goals of this project was implementing secure communication between AWS and Azure.

A **Site-to-Site IPSec VPN** was established between:

AWS VPC

```
10.0.0.0/16
```

Azure VNet

```
10.1.0.0/16
```

This enables resources deployed in AWS to securely communicate with resources deployed inside Azure without exposing backend traffic to the public internet.

---

# 📦 Application Stack

Frontend

- React
- Vite

Backend

- Node.js
- Express.js
- JWT Authentication

Database

- MySQL

Containerization

- Docker

Container Registry

- Amazon ECR

Orchestration

- Kubernetes (Amazon EKS)

Infrastructure

- Terraform

Networking

- AWS Load Balancer
- NGINX Ingress Controller
- Site-to-Site VPN

---

# 📁 Repository Structure

```text
bank-multicloud-platform
│
├── terraform
│   ├── modules
│   └── environments
│
├── kubernetes
│   ├── backend
│   ├── frontend
│   ├── ingress
│   ├── mysql
│   └── namespace
│
├── online-bank-app
│   ├── backend
│   └── frontend-react
│
└── README.md
```

---

# 🚀 Deployment Steps

## Clone Repository

```bash
git clone https://github.com/<username>/bank-multicloud-platform.git

cd bank-multicloud-platform
```

---

# Provision AWS Infrastructure

```bash
cd terraform/environments/dev

terraform init

terraform plan

terraform apply
```

---

# Configure kubectl

```bash
aws eks update-kubeconfig \
--region us-east-1 \
--name dev-bank-cluster
```

Verify cluster

```bash
kubectl get nodes

kubectl get pods -A
```

---

# Build Docker Images

Backend

```bash
cd online-bank-app/backend

docker build -t dev-backend:v1 .
```

Frontend

```bash
cd online-bank-app/frontend-react

docker build -t dev-frontend:v1 .
```

---

# Push Images to Amazon ECR

Authenticate

```bash
aws ecr get-login-password \
--region us-east-1 \
| docker login \
--username AWS \
--password-stdin <ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com
```

Tag Images

```bash
docker tag dev-backend:v1 \
<ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/dev-backend:v1
```

```bash
docker tag dev-frontend:v1 \
<ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/dev-frontend:v1
```

Push

```bash
docker push <ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/dev-backend:v1

docker push <ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/dev-frontend:v1
```

---

# Deploy Application

```bash
kubectl apply -f kubernetes/
```

Verify

```bash
kubectl get all -n bank-app
```

---

# Kubernetes Networking

The application uses:

## ClusterIP

Used for:

- Frontend → Backend communication
- Backend → Database communication

## LoadBalancer

Used for:

- External access to the application

## NGINX Ingress

Used for:

- HTTP Routing
- Path-based routing
- Single entry point into the cluster

---

# VPN Configuration

AWS

- Virtual Private Gateway
- Customer Gateway
- VPN Connection

Azure

- VPN Gateway
- Local Network Gateway
- VPN Connection

The VPN successfully established secure connectivity between both cloud providers.

---

# Verification

Terraform

```bash
terraform state list
```

Kubernetes

```bash
kubectl get nodes

kubectl get pods

kubectl get svc

kubectl get ingress
```

VPN

Azure

```bash
az network vpn-connection show \
--resource-group rg-bank-multicloud-dev \
--name azure-to-aws-connection
```

Expected Output

```
Status: Connected
```

---

# Skills Demonstrated

- AWS
- Microsoft Azure
- Amazon EKS
- Docker
- Kubernetes
- Terraform
- Infrastructure as Code
- Amazon ECR
- Site-to-Site VPN
- Cloud Networking
- VPC Design
- Azure Virtual Network
- Load Balancer
- NGINX Ingress
- Linux
- Git
- GitHub

---

# Future Improvements

- GitHub Actions CI/CD Pipeline
- ArgoCD for GitOps deployment
- Helm Charts
- Azure Database for MySQL
- Route53 + Azure Private DNS integration
- Monitoring with Prometheus & Grafana
- TLS certificates using cert-manager
- Horizontal Pod Autoscaler
- External Secrets
- AWS Secrets Manager integration

---

# Lessons Learned

This project gave me practical experience in designing and deploying a secure multi-cloud architecture.

Some key lessons include:

- Designing cloud infrastructure with Terraform
- Managing Kubernetes workloads on Amazon EKS
- Containerizing applications using Docker
- Implementing Kubernetes networking with ClusterIP, LoadBalancer and Ingress
- Establishing secure communication between AWS and Azure using a Site-to-Site VPN
- Troubleshooting cloud infrastructure and networking issues
- Understanding how enterprise applications can be deployed across multiple cloud providers

---

# Author

**Paschal Chukwuka Akabuogu**

Cloud & DevOps Engineer

GitHub:
https://github.com/pcdeking

LinkedIn:
https://www.linkedin.com/in/paschal-akabuogu-185490191

---

⭐ If you found this project interesting, feel free to star the repository.
