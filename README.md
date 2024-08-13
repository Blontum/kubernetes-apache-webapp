# Kubernetes Apache Web Application

## Overview

This project demonstrates deploying an Apache web application on an Amazon EKS (Elastic Kubernetes Service) cluster. It includes Kubernetes manifests for deploying an Apache application and exposing it via a LoadBalancer service.

## Project Structure

- `apache-deployment-manifest.yml`: Kubernetes deployment manifest for the Apache application with 5 replicas.
- `apache-service-lb-manifest.yml`: Kubernetes service manifest to expose the Apache application using a LoadBalancer.
- `index.html`: Example HTML file served by the Apache application.
- `indexhtml.yml`: (Deleted) Previous manifest or configuration file related to the project.

## Setup Instructions

### 1. Create EKS Cluster

To create the EKS cluster, use the following `eksctl` command:

```bash
eksctl create cluster --name playground-cluster --region us-west-2 --nodes 3

#2. Deploy Apache Application
Apply Deployment Manifest:
