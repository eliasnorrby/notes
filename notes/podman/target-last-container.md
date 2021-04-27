---
subject: podman
tags:
  - podman
  - container
snippets:
  - syntax: bash
    content: |
      podman exec -l
---

# Target last container

`podman` remembers the last container used in any command. To target it again
without referencing a container name or id, use the `-l` flag:

```bash
$ podman inspect hello-world
$ podman exec -l ls /tmp
```
