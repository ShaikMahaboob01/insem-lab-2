# Event Management Fullstack Application Helm Chart

This Helm chart deploys the Event Management Fullstack Application on a Kubernetes cluster. The application helps organizers plan, manage, and track events, participants, and schedules efficiently. It consists of frontend and backend services deployed as separate Kubernetes deployments, exposed via services and an ingress.

## Features

- Scalable frontend and backend deployments with configurable replicas
- Kubernetes Services for internal communication and exposure
- Ingress resource for external access with optional TLS support
- Resource requests and limits configured for CPU and memory
- Readiness and liveness probes for health checks and high availability
- Rolling update strategy for zero downtime deployments
- Easy configuration through the `values.yaml` file

## Prerequisites

- Kubernetes cluster (v1.19+ recommended)
- Helm 3.x installed and configured
- Docker registry access to push/pull frontend and backend images
- Ingress controller installed (e.g., NGINX Ingress Controller)
- (Optional) TLS certificates managed via Kubernetes secrets if TLS is enabled

## Installation

1. Clone or download this Helm chart repository.

2. Build and push Docker images for frontend and backend:

   - Navigate to frontend and backend source directories (from the original app repo)
   - Build images:

        docker build -t your-docker-registry/event-management-frontend:latest ./frontend
        docker build -t your-docker-registry/event-management-backend:latest ./backend

   - Push images to your registry:

        docker push your-docker-registry/event-management-frontend:latest
        docker push your-docker-registry/event-management-backend:latest

3. Configure the `values.yaml` file to specify your image repository, tags, replica counts, resource limits, and ingress settings.

4. Install the Helm chart:

       helm install event-management ./event-management

5. Verify the deployment:

       kubectl get pods
       kubectl get svc
       kubectl get ingress

## Configuration

You can customize the deployment by modifying the `values.yaml` file before installation or during upgrades.

### Replica Counts

