# Kubernetes Apache Web Application

## Project Overview

This project deploys a simple Apache web server on a Kubernetes cluster using a Deployment and a LoadBalancer Service. The Deployment manages a set of Apache server pods, and the Service exposes the application to the internet via a LoadBalancer.

## Prerequisites

- **Kubernetes Cluster:** A running Kubernetes cluster (e.g., EKS, Minikube).
- **kubectl:** Command-line tool for interacting with the Kubernetes cluster.
- **AWS CLI:** For interacting with AWS services (if using EKS).

## Setup Instructions

### 1. Clone the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/<your-username>/kubernetes-apache-webapp.git
cd kubernetes-apache-webapp
## Setup Instructions

### 2. Apply Kubernetes Manifests

- **Deployment:** Create a Deployment for the Apache web server:

  ```bash
  kubectl apply -f apache-deployment-manifest.yml
 