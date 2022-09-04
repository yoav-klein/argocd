# Argo CD
---

This repository holds examples and demonstrations of using ArgoCD.

## Infrastructure
---
You need a kubernetes cluster of course.

### Install ArgoCD
```
$ kubectl create namespace argocd
$ kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/core-install.yaml
```

### Download the CLI
```
$ curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
$ chmod +x /usr/local/bin/argocd
```

### Access the Argo CD API Server
By default, the Argo CD API server is not exposed with an external IP.
You can expose it in many ways. What we'll do here is use port-forwarding.

Just run the `port-forward.sh` script, and you have Argo CD on port 8080.

### Login with the CLI
We login with the `admin` user. Run the `login.sh` command to login.

## Demonstrations
---

In the `demos` directory we'll have a list of demonstrations.
We'll be working in the `argo-demo` namespace, so make sure you have it.
