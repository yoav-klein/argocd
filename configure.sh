#!/bin/bash


source <(argocd completion bash)


clean_ns() {
    kubectl delete all --all -n argo-demo
}

call_svc() {
    svc=$1
    curl $(kubectl get svc $svc -o jsonpath='{.spec.clusterIP}')
}
