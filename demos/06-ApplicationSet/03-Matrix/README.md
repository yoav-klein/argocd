# Matrix
---

Matrix allows you to define more than one (or maybe just 2?) generators, and generate
all the combinations of values of both these generators. For example, if you have a `Git`
generator which will produce 3 sets of parameters, and a `List` generator which will produce
2 sets of parameters, you can combine them using the Matrix generator to get 6 sets of parameters.

In this example, we'll deploy the `foo`, `bar` and `baz` applications, for both prod and dev environments.
For each environment, a different values file will be used, and each environment will be in a different namespace.

For this, we're going to use a matrix of the `git directory` generator and the `git files` generator.
The `git directory` generator will generate the `foo`, `bar` and `baz` parameters, and the `git files`
generator will generate the namespace name and values file name to be used.

## Usage

First, create the `dev` and `prod` namespaces.
```
$ kubectl create ns dev
$ kubectl create ns prod
```

Now, create te ApplicationSet:
```
$ kubectl apply -f application-set.yaml
```


