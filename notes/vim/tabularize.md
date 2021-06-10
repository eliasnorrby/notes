---
subject: vim
tags:
  - vim
snippets:
  - syntax: vim
    content: |-
      :Tabularize /:
---

# The tabular plugin

The [tabular][tabular-git] vim plugin can be used for some cool text
manipulation. Say we have some command output we want to make more readable:

```
~/forks/tektoncd/pipeline/docs
❯ grep -rHin 'weight:'
variables.md:4:weight: 15
taskruns.md:4:weight: 2
labels.md:4:weight: 10
metrics.md:4:weight: 14
pipelineruns.md:4:weight: 4
runs.md:4:weight: 2
resources.md:4:weight: 6
workspaces.md:4:weight: 5
install.md:4:weight: 1
migrating-v1alpha1-to-v1beta1.md:4:weight: 18
deprecations.md:4:weight: 19
auth.md:4:weight: 7
tekton-controller-performance-configuration.md:4:weight: 16
conditions.md:4:weight: 11
podtemplates.md:4:weight: 12
events.md:4:weight: 2
container-contract.md:4:weight: 8
tekton-bundle-contracts.md:4:weight: 8
tasks.md:4:weight: 1
migrating-from-knative-build.md:4:weight: 17
pipelines.md:4:weight: 3
logs.md:4:weight: 9
enabling-ha.md:4:weight: 13
```

If we put it in a vim buffer, it's as easy as calling:

```vim
:Tabularize /:
```

```
variables.md                                   : 4 : weight : 15
taskruns.md                                    : 4 : weight : 2
labels.md                                      : 4 : weight : 10
metrics.md                                     : 4 : weight : 14
pipelineruns.md                                : 4 : weight : 4
runs.md                                        : 4 : weight : 2
resources.md                                   : 4 : weight : 6
workspaces.md                                  : 4 : weight : 5
install.md                                     : 4 : weight : 1
migrating-v1alpha1-to-v1beta1.md               : 4 : weight : 18
deprecations.md                                : 4 : weight : 19
auth.md                                        : 4 : weight : 7
tekton-controller-performance-configuration.md : 4 : weight : 16
conditions.md                                  : 4 : weight : 11
podtemplates.md                                : 4 : weight : 12
events.md                                      : 4 : weight : 2
container-contract.md                          : 4 : weight : 8
tekton-bundle-contracts.md                     : 4 : weight : 8
tasks.md                                       : 4 : weight : 1
migrating-from-knative-build.md                : 4 : weight : 17
pipelines.md                                   : 4 : weight : 3
logs.md                                        : 4 : weight : 9
enabling-ha.md                                 : 4 : weight : 13
```

## Bonus: buffer filtering

After some block selection editing,

```
variables.md                                    weight: 15
taskruns.md                                     weight: 2
labels.md                                       weight: 10
metrics.md                                      weight: 14
pipelineruns.md                                 weight: 4
runs.md                                         weight: 2
resources.md                                    weight: 6
workspaces.md                                   weight: 5
install.md                                      weight: 1
migrating-v1alpha1-to-v1beta1.md                weight: 18
deprecations.md                                 weight: 19
auth.md                                         weight: 7
tekton-controller-performance-configuration.md  weight: 16
conditions.md                                   weight: 11
podtemplates.md                                 weight: 12
events.md                                       weight: 2
container-contract.md                           weight: 8
tekton-bundle-contracts.md                      weight: 8
tasks.md                                        weight: 1
migrating-from-knative-build.md                 weight: 17
pipelines.md                                    weight: 3
logs.md                                         weight: 9
enabling-ha.md                                  weight: 13
```

we can use the external `sort` program to sort the entries based on their
respective weights:

```vim
%!sort -n -t ':' -k2
```

```
install.md                                      weight: 1
tasks.md                                        weight: 1
events.md                                       weight: 2
runs.md                                         weight: 2
taskruns.md                                     weight: 2
pipelines.md                                    weight: 3
pipelineruns.md                                 weight: 4
workspaces.md                                   weight: 5
resources.md                                    weight: 6
auth.md                                         weight: 7
container-contract.md                           weight: 8
tekton-bundle-contracts.md                      weight: 8
logs.md                                         weight: 9
labels.md                                       weight: 10
conditions.md                                   weight: 11
podtemplates.md                                 weight: 12
enabling-ha.md                                  weight: 13
metrics.md                                      weight: 14
variables.md                                    weight: 15
tekton-controller-performance-configuration.md  weight: 16
migrating-from-knative-build.md                 weight: 17
migrating-v1alpha1-to-v1beta1.md                weight: 18
deprecations.md                                 weight: 19
```

Source: [tabular][tabular-git]

[tabular-git]: https://github.com/godlygeek/tabular
