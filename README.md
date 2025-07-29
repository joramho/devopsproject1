# Devops Project 1

Deploy an app to AWS EKS with ingress controller in three tier vpc and expose the app via application load balancer.

PreRequisites:
AWS CLI configured (aws configure)
kubectl, eksctl, and helm installed
IAM permissions to create VPC, EKS, ALB, etc
Docker image pushed to ECR or another accessible registry

1. Create a 3-Tier VPC:
```
eksctl create cluster \
  --name devopsproject1 \
  --region us-west-2 \
  --nodes 3 \
  --node-type t3.micro \
  --managed
```

2. Install the AWS Load Balancer Controller
a) Create IAM Policy:
```
curl -o iam-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json
```
```
aws iam create-policy \
  --policy-name AWSLoadBalancerControllerIAMPolicy \
  --policy-document file://iam-policy.json
```
b) Associate IAM Policy with EKS Node Role:
```
eksctl create iamserviceaccount \
  --cluster devopsproject1 \
  --namespace kube-system \
  --name aws-load-balancer-controller \
  --attach-policy-arn arn:aws:iam::197693987766:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve \
  --region us-west-2
```

c) Install AWS Load Balancer Controller
```
helm repo add eks https://aws.github.io/eks-charts
helm repo update
```
```
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=my-cluster \
  --set serviceAccount.create=false \
  --set region=us-west-2 \
  --set vpcId=vpc-xxxxxxxx \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set ingressClass=alb
```

3. Deploy Your Application
```
# app-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: my-app
        image: <your-ecr-image>
        ports:
        - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: my-app-service
spec:
  type: NodePort
  ports:
    - port: 80
      targetPort: 80
      protocol: TCP
  selector:
    app: my-app
```
```
kubectl apply -f app-deployment.yaml
```

4. Create Ingress Resource (Expose via ALB)
```
# ingress.yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-app-ingress
  annotations:
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/target-type: ip
    kubernetes.io/ingress.class: alb
spec:
  rules:
    - http:
        paths:
        - path: /
          pathType: Prefix
          backend:
            service:
              name: my-app-service
              port:
                number: 80
```
```
kubectl apply -f ingress.yaml
```
The ALB Controller will automatically create an ALB for your Ingress. To get external URL run:
```
kubectl get ingress
```

# FAQs:
What is a 3 tier VPC? (web --> backend --> database)
- Separates your infra into 3 logical layers for better security, scalability, and maintainability.

* Security - Reduces attack surface by isolating app and data layers
* Scalability - Each tier can scale independently
* Manageability - Easier to troubleshoot, monitor, and secure 

A) Presentation (Web) Tier [Application Load Balancer (ALB), NGINX ingress controller]
* Handles external traffic (ex: browser requests)
* Hosts load balancers, API gateways, or reverse proxies
* Deployed in public subnets
B) Application (Logic) Tier [Kubernetes pods running backend services]
* Runs the main business logic of the app
* Deployed in private subnets (no direct internet access)
C) Data Tier [Amazon RDS, DynamoDB, or a database pod/service]
* Manages data storage and databases
* Deployed in isolated/private subnets
