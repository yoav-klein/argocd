# Private Repostories

In order to pull manifests from a private repository, you need to provide ArgoCD
with credentials for this repository.

In this demo, we'll deploy an application located in our `argo-private` repo.

## Usage

We need to add the repository defintion to ArgoCD.
We can use HTTPS or SSH for this.

With HTTPS, we'll use a GitHub Personal Access Token

### CLI
We'll do this with the following command:


```
$ argocd repo add https://github.com/argoproj/argocd-example-apps --username something --password <GitHub PAT>
```
Now, create the Application 
```
$ argocd app create foo --repo https://github.com/yoav-klein/private-argo  \
        --path foo-k8s --dest-server https://kubernetes.default.svc
```

### Declarative
This can also be done in a declarative way.
