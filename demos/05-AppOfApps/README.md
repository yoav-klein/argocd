# App of Apps
---

App of Apps is a known pattern for deploying a set of Argo CD Applications together.
It works like this: we create one Application (either a Helm chart, native kubernetes manifests, etc.)
which contains a one or (usually) more Application manifests, which in turn will deploy
other kubernetes manifests.

## Deploy

```
$ kubectl apply -f app-of-apps.yaml
```

This will create the `apps` Application, which will create the `foo`, `bar` and `baz` Applications.
