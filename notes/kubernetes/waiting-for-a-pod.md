---
subject: kubernetes
tags:
  - kubernetes
  - k8s
snippets:
  - syntax: bash
    content: |-
      kubectl wait --for=condition=ready pod --selector "app=my-app" --timeout="60s"
---

# Waiting for a pod to be ready

If we need to wait for a pod to come up before proceeding with other actions,
we can use `kubectl wait`:

```bash
kubectl wait --for=condition=ready pod --selector "app=my-app" --timeout=60s
```

Source: `man kubectl-wait`
