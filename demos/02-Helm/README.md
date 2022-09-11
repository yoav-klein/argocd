# Helm
---

This will demonstrate how to deploy a Helm chart using Argo CD.

We'll be deploying the foo application to the `argo-demo` namespace,
once with the `values-dev.yaml` values file, and once with the `values-prod.yaml`
values file.

We'll do this in 2 ways: declarative and CLI.

## Starting state
Start with the `argo-demo` namespace clean

## Run

### Declarative

```
$ kubectl apply -f foo-helm.yaml
```

Now try changing the `.helm.valueFiles` file and run this again.

### CLI

Run
```
$ argocd app create foo --repo https://github.com/yoav-klein/argocd \
           --path manifests/foo-helm \
           --dest-server https://kubernetes.default.svc \
           --dest-namespace argo-demo \
           --values=values-prod.yaml
```

Now you can change the values file as such:
```
$ argocd app set foo --values values-dev.yaml
```

## Setting Individual Parameters
You can also set individual parameters of a Helm Application.
For example, let's edit the image.tag:


### Declarative
Apply the `argo-helm-set-tag.yaml` file

### CLI

```
$ argocd app set foo -p image.tag=2.0
```



