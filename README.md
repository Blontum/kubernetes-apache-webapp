# Kubernetes Apache Web Application Homework

This README provides step-by-step instructions to complete the Kubernetes homework assignment, which involves containerizing an Apache web application and deploying it on an Amazon EKS cluster.

## Prerequisites

- AWS CLI installed and configured
- Docker installed
- kubectl installed
- GitHub account
- DockerHub account

## Step 1: Containerize the Apache Application

1. Create a directory for your project:
   ```bash
   mkdir kubernetes-apache-webapp
   cd kubernetes-apache-webapp
   ```

2. Create a simple index.html file:
   ```bash
   echo "<h1>Hello from Kubernetes!</h1>" > index.html
   ```

3. Create a Dockerfile:
   ```bash
   cat << EOF > Dockerfile
   FROM httpd:2.4
   COPY index.html /usr/local/apache2/htdocs/
   EOF
   ```

4. Build the Docker image:
   ```bash
   docker build -t your-dockerhub-username/apache-app:v1 .
   ```

5. Push the image to DockerHub:
   ```bash
   docker login
   docker push your-dockerhub-username/apache-app:v1
   ```

## Step 2: Deploy EKS Cluster

1. Create an EKS cluster (this may take 10-15 minutes):
   ```bash
   eksctl create cluster --name playground-cluster --region us-west-2 --nodes 3 --node-type t3.medium
   ```

2. Configure kubectl to use your cluster:
   ```bash
   aws eks update-kubeconfig --name playground-cluster --region us-west-2
   ```

## Step 3: Create Kubernetes Manifests

1. Create a deployment.yaml file:
   ```bash
   cat << EOF > deployment.yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: apache-deployment
   spec:
     replicas: 5
     selector:
       matchLabels:
         app: apache
     template:
       metadata:
         labels:
           app: apache
       spec:
         containers:
         - name: apache
           image: your-dockerhub-username/apache-app:v1
           ports:
           - containerPort: 80
   EOF
   ```

2. Create a service.yaml file:
   ```bash
   cat << EOF > service.yaml
   apiVersion: v1
   kind: Service
   metadata:
     name: apache-service
   spec:
     type: LoadBalancer
     ports:
     - port: 80
       targetPort: 80
     selector:
       app: apache
   EOF
   ```

## Step 4: Deploy to Kubernetes

1. Apply the Kubernetes manifests:
   ```bash
   kubectl apply -f deployment.yaml
   kubectl apply -f service.yaml
   ```

2. Wait for the LoadBalancer to get an external IP:
   ```bash
   kubectl get services -w
   ```

## Step 5: Verify Deployment

1. Describe the service:
   ```bash
   kubectl describe service apache-service
   ```

2. Describe a pod:
   ```bash
   kubectl describe pod $(kubectl get pods -l app=apache -o jsonpath="{.items[0].metadata.name}")
   ```

3. Access your application:
   - Get the LoadBalancer's external IP:
     ```bash
     kubectl get services apache-service -o jsonpath="{.status.loadBalancer.ingress[0].hostname}"
     ```
   - Open this address in a web browser

## Step 6: Create GitHub Repository

1. Create a new repository on GitHub named "kubernetes-apache-webapp"

2. Initialize git in your local project directory:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/your-username/kubernetes-apache-webapp.git
   git push -u origin main
   ```

## Submission

1. GitHub Repository Link: https://github.com/your-username/kubernetes-apache-webapp

2. Screenshots:
   - Add screenshots of `kubectl describe service` and `kubectl describe pod` outputs to this README
   - Add a screenshot of your application running in a web browser to this README

## Cleanup

To avoid unnecessary AWS charges, remember to delete your EKS cluster when you're done:

```bash
eksctl delete cluster --name playground-cluster --region us-west-2
```

## Troubleshooting

If you encounter issues, check the following:
- Ensure all kubectl commands are run from the project directory
- Verify that your Docker image was pushed to DockerHub successfully
- Check pod logs: `kubectl logs -l app=apache`
- Ensure your AWS CLI is configured with the correct credentials and region


