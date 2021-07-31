#!/bin/bash
set -e

echo "----------------------Installing pages---------------------------------"

RELEASE_NAME=${{ secrets.RELEASE_NAME }} 

NAMESPACE=${{ secrets.STAGING_NAMESPACE }}


kubectl get ns "$NAMESPACE" &> /dev/null || kubectl create ns "$NAMESPACE"

   

helm upgrade --install $RELEASE_NAME pages -n $NAMESPACE --debug
helm list
kubectl config current-context
sleep 30s

kubectl get pods -n "$NAMESPACE"


echo "----------------------Completed Installation of pages------------------"