#!/bin/bash

#Build the infrastructure
terraform init
terraform plan -target=module.network -target=module.eks
terraform apply -target=module.network -target=module.eks -auto-approve

#get cluster manifest and certificate for kubectl operations
aws eks update-kubeconfig --region eu-west-1 --name eks-staging

#deploy cluster-autoscaler
kubectl apply -f ./modules/k8s/ca.yaml

#deploy other kubernetes resources
terraform plan -target=module.k8s
terraform apply -target=module.k8s -auto-approve

#deploy nginx microservice and nginx ingress service with LB
kubectl apply -f ./modules/k8s/nginx-target
kubectl apply -f ./modules/k8s/nginx-ingress

