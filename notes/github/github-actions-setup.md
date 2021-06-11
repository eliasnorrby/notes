---
subject: github
tags:
  - github
  - ci
  - cicd
snippets:
  - syntax: bash
    content: |-
      mkdir -p .github/workflows && touch .github/workflows/example.yaml
  - syntax: yaml
    content: |-
      name: example job

      on: pull_request

      jobs:
        lint:
          runs-on: ubuntu-latest
          steps:
            - uses: actions/checkout@v2
            - name: yamllint
              run: yamllint .
---

# Setting up GitHub Actions

To set up GitHub Actions in a project, all you need to do is place a valid
workflow file within the `.github/workflows` directory. Here's an example
(`.github/workflows/example.yaml`), running `yamllint` when a pull request is
opened.

```yaml
name: example job

on: pull_request

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: yamllint
        run: yamllint .
```
