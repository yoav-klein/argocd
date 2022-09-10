#!/bin/bash


source <(argocd completion bash)


clean_ns() {
    kubectl delete all --all -n argo-demo
}
