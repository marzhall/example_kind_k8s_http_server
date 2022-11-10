#!/bin/bash
# NOTE: Script assumes you've installed kubectl
# NOTE: RUN THIS IN THE TOP LEVEL OF THIS REPO

# Install kind
go install sigs.k8s.io/kind@v0.17.0
# Installs an nginx ingress handler on the cluster. See: https://kind.sigs.k8s.io/docs/user/ingress/
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

kind create cluster --config ../cluster-config.yaml
docker build -t server:newer .
kind load docker-image server:newer
kubectl wait --namespace ingress-nginx   --for=condition=ready pod   --selector=app.kubernetes.io/component=controller   --timeout=90s
kubectl apply -f httptest.yaml