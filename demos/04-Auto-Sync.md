# Auto Sync
---

Argo CD has the ability to automatically sync an application when it detects
differences between the desired manifests in git and the live state in the cluster.

## Automatic Sync Policy

Start from an empty `argo-demo` namespace.

In the simplest form, automatic sync will just sync
the cluster with the manifests in git.

### CLI
If you already have an Application, you can set auto-sync as such:
```
$ argocd app set <APPNAME> --sync-policy automated
```

### Declarative
Run
```
$ kubectl apply -f auto-sync.yaml
```

## 
