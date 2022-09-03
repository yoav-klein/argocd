# Simple YAML Directory
---

In this first example, we deploy the `foo` application using simple kubernetes manifests.
We'll do this in 2 ways:
1. Declarative - using an `Application` manifest
2. CLI - using the Argo CD CLI.

## Starting state
Start with having the `argo-demo` namespace empty

## Declarative
This is done by appying the `foo-app.yaml` file.
```
$ kubectl apply -f foo-app.yaml
```


