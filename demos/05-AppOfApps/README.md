# App of Apps
---

App of Apps is a known pattern for deploying a set of Argo CD Applications together.
It works like this: we create one Application (either a Helm chart, native kubernetes manifests, etc.)
which contains a one or (usually) more Application manifests, which in turn will deploy
other kubernetes manifests.

In the main App, we create the `foo`, `bar` and `bar` Applications. We define 
a `env` field in the values file of the main app, and use it as the values file
for those Applications.
Additionally, we define a `endpoints.kafka` field in the values file of the main app, 
which we use as an override for the Applications.

## Deploy

```
$ kubectl apply -f app-of-apps.yaml
```

This will create the `apps` Application, which will create the `foo`, `bar` and `baz` Applications.


## Notes

After deploying this, if you look at the `foo` Application, in the PARAMETERS tab, you'll be able to see
that the `endpoints.kafka` parameter is overriden. That's because it is not the value that appears
in the values file of that `foo` Application. Rather, it is defined in the overrides of this Application, i.e. 
the `.spec.helm.parameters` field of this Application.
