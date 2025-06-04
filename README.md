
# MLOps Pipeline on AWS with EKS

This project demonstrates an end-to-end MLOps pipeline that deploys a machine learning model using:

- Jenkins for CI/CD
- Docker for containerization
- Kubernetes (EKS) for orchestration
- Terraform for infrastructure provisioning
- Prometheus & Grafana for monitoring

## Architecture

1. **Model Deployment as REST API** (Flask)
2. **Dockerized Application**
3. **Jenkins Pipeline** to build & push Docker image
4. **Kubernetes Manifests** for deployment on EKS
5. **Terraform** for provisioning AWS resources
6. **Prometheus & Grafana** for monitoring

### Architecture Diagram
                 +------------------+
                 |   Jenkins (CI)   |
                 +--------+---------+
                          |
                          v
                +---------+----------+
                |  Docker Build/Push |
                +---------+----------+
                          |
                          v
              +-----------+-----------+
              | Kubernetes (EKS)      |
              | +-------------------+ |
              | |  Flask Model API  | |
              | +-------------------+ |
              +-----------+-----------+
                          |
         +----------------+----------------+
         |                                 |
+------------------+         +-------------------------+
|  Prometheus      |         |  Grafana Dashboard      |
+------------------+         +-------------------------+



## API Usage

- **Endpoint:** `/predict`
- **Method:** POST
- **Payload:**
```json
{
  "features": [5.1, 3.5, 1.4, 0.2]
}
```

## server Setup

```bash
terraform init
terraform plan
terraform apply
```
## EKS Setup

```bash
aws eks --region us-east-1 update-kubeconfig --name mlops-eks
kubectl get nodes
kubectl apply -f prometheus/prometheus-config.yaml
kubectl apply -f prometheus/prometheus-deployment.yaml
kubectl apply -f prometheus/prometheus-service.yaml
kubectl apply -f k8s/grafana/grafana-config.yaml
kubectl apply -f k8s/grafana/grafana-deployment.yaml
kubectl apply -f k8s/grafana/grafana-service.yaml
```
