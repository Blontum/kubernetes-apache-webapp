Kubernetes Apache Web Application
Project Overview
This project deploys a simple Apache web server on a Kubernetes cluster using a Deployment and a LoadBalancer Service. The Deployment manages a set of Apache server pods, and the Service exposes the application to the internet via a LoadBalancer.
Prerequisites

Kubernetes Cluster: A running Kubernetes cluster (e.g., EKS, Minikube).
kubectl: Command-line tool for interacting with the Kubernetes cluster.
AWS CLI: For interacting with AWS services (if using EKS).

Setup Instructions
1. Clone the Repository
Clone the repository to your local machine:
bashCopygit clone https://github.com/<your-username>/kubernetes-apache-webapp.git
cd kubernetes-apache-webapp
2. Apply Kubernetes Manifests
Deployment: Create a Deployment for the Apache web server:
bashCopykubectl apply -f apache-deployment-manifest.yml
Service: Expose the Deployment with a LoadBalancer Service:
bashCopykubectl apply -f apache-service-lb-manifest.yml
3. Verify Deployment and Service
Check the status of the Deployment:
bashCopykubectl get deployments
Check the status of the Service:
bashCopykubectl get services
4. Access the Application
Once the Service is created and the LoadBalancer is provisioned, access your Apache web server using the external IP or DNS name provided by the LoadBalancer. Open your web browser and navigate to:
Copyhttp://<external-ip-or-dns>
5. Troubleshooting
Check Pods: View pod status and logs if there are issues:
bashCopykubectl get pods
kubectl logs <pod-name>
Describe Resources: Get detailed information about services or deployments:
bashCopykubectl describe svc apache-service
kubectl describe deployment apache-deployment
Project Structure

Dockerfile: Defines the Docker image for the Apache web server.
apache-deployment-manifest.yml: Kubernetes Deployment manifest for Apache.
apache-service-lb-manifest.yml: Kubernetes Service manifest for LoadBalancer.
README.md: Project documentation.
index.html: Sample HTML content for the Apache web server.

Additional Notes

Make sure to replace <external-ip-or-dns> with the actual IP or DNS name of your LoadBalancer.
Modify the Dockerfile or manifests as needed based on specific project requirements.

License
This project is licensed under the MIT License.

Make sure to replace <external-ip-or-dns> with the actual IP or DNS name of your LoadBalancer.
Modify the Dockerfile or manifests as needed based on specific project requirements.

License
This project is licensed under the MIT License.
