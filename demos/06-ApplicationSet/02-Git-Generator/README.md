# Git Generator

In this example, we'll use an ApplicationSet to deploy our `foo`, `bar` and `baz` applications.
The git generator is divided to 2 subtypes: The git files generator and the git directories generator.

## Directories
In this subtype, parameters are provided based on directories in the git repository.
This means: we provide a list of paths in our repository, and Application instances
are rendered with set of parameters for each discovered directory in the specified paths.

In our example, we pass in the `manifests/helm/*` directories, excluding the `manifests/helm/apps` directory
which is the App of Apps (we don't want to use it when we're using ApplicationSet of course).

The ApplicationSet controller will generate an `Application` for each directory found under the `manifests/helm` directory, providing a set of parameters such as the `path`, `path.basename`, etc. Those parameters will be serving us in
the Application template.

### Creating the Applications
In order to create the Applications using the ApplicationSet, let's apply the ApplicationSet:
```
$ kubeclt apply -f application-set.yaml
```

This will create the Applications in our cluster.

### Delete the Applications
Deleting the ApplicationSet will delete all the Applications created by it.

```
$ kubectl delete applicationset -n argocd my-microservices-application
```
