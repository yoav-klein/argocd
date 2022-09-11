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

### Test

Fist, let's see our deployment in action:
```
$ FOO_IP=$(kubectl -n argo-demo get svc foo -o jsonpath="{.spec.clusterIP}")
$ curl $FOO_IP
```
After configuring our Application with auto-sync, let's test it.
Make a commit that'll change the image tag to `2.0`, and run again.

## Automatic Pruning
---
By default, if you remove a resource from Git, Argo CD will not delete it from the cluster.
In order for this to happen, you can to configure automatic pruning.

### CLI
```
$ argocd app set <APPNAME> --auto-prune
```

### Declarative
```
spec:
  syncPolicy:
    automated:
      prune: true
```

See the `auto-prune.yaml`

### Test
Start from an empty `argo-demo` namespace again, and apply the `auto-prune.yaml`
Now, delete the Service object in Git, push, and see what happens.

Don't forget to revert that commit !


## Self-Heal
By default, changes that are made to the live cluster will not trigger an automated sync.
This can also be configured with the selfHeal option.

### CLI
```
$ argocd app set <APPNAME> --self-heal
```

### Declarative
```
spec:
  syncPolicy:
    automated:
      selfHeal: true
```

See the `self-heal.yaml`

### Test
Start from an empty `argo-demo` namespace again, and apply the `self-heal.yaml`
Now, delete the service object in the cluster, and see what happens.



