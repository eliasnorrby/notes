---
subject: npm
tags:
  - npm
  - node
  - publish
snippets:
  - syntax: bash
    content: |-
      npm config set key value --userconfig .npmrc
---

# Update a value in a project's .npmrc

`npm config` will prefer to use the user-local `.npmrc` (i.e. `~/.npmrc`). We
can repurpose the `--userconfig` flag to write to an arbitrary file (e.g. an
`.npmrc` stored in a project) instead:

```bash
npm config set key value --userconfig .npmrc
```

This can be useful in CI scenarios:

```yaml
- name: Configure NPM_TOKEN
  run: npm config set '//npm.pkg.github.com/:_authToken' "${NPM_TOKEN}" --userconfig .npmrc
  env:
    NPM_TOKEN: ${{ secrets.NPM_TOKEN }}
- name: Install dependencies
  run: npm ci
- name: Remove NPM_TOKEN config
  run: npm config delete '//npm.pkg.github.com/:_authToken' --userconfig .npmrc
```

Source: [stackoverflow][1]

[1]: https://stackoverflow.com/questions/27788398/how-to-npm-config-save-into-project-npmrc-file
