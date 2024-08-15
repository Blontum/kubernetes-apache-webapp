# Kubernetes Apache Web Application

## Overview

This project deploys an Apache web server on a Kubernetes cluster using a Deployment and a LoadBalancer Service. It demonstrates how to manage Apache server pods and expose the application to the internet.

## Prerequisites

- Kubernetes cluster (e.g., EKS, Minikube)
- `kubectl` CLI tool
- AWS CLI (if using EKS)

## Quick Start

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/kubernetes-apache-webapp.git
   cd kubernetes-apache-webapp
   ```

2. Apply Kubernetes manifests:
   ```bash
   kubectl apply -f apache-deployment-manifest.yml
   kubectl apply -f apache-service-lb-manifest.yml
   ```

3. Verify deployment:
   ```bash
   kubectl get deployments
   kubectl get services
   ```

4. Access the application:
   Open `http://<external-ip-or-dns>` in your web browser
   (Replace `<external-ip-or-dns>` with the LoadBalancer's external IP or DNS)

## Troubleshooting

- Check pod status:
  ```bash
  kubectl get pods
  kubectl logs <pod-name>
  ```

- Describe resources:
  ```bash
  kubectl describe svc apache-service
  kubectl describe deployment apache-deployment
  ```

## Project Structure

- `Dockerfile`: Apache web server image configuration
- `apache-deployment-manifest.yml`: Kubernetes Deployment manifest
- `apache-service-lb-manifest.yml`: LoadBalancer Service manifest
- `index.html`: Sample web content
- `README.md`: This file

## Notes

- Customize the Dockerfile or manifests as needed for your specific use case
- Implement appropriate security measures for production deployments

## License

This project is licensed under the MIT License.
