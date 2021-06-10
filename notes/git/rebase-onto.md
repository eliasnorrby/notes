---
subject: git
tags:
  - git
  - rebase
snippets:
  - syntax: bash
    content: |-
      git rebase --onto somewhere base extension
---

# Replaying a set of changes on a specific branch

```bash
git rebase --onto somewhere base extension
```

> Take the `extension` branch, figure out where it diverged from the `base`
> branch, and replay these patches in the `extension branch` as if it was based
> off the `somewhere` branch instead.

With a history like this,

```
c1 - c2 - c3 (master)
      \
        c4 - c5 - c6 (server)
              \
                c7 - c8 (client)
```

running

```bash
git rebase --onto master server client
```

would result in:

```
          (master)
c1 - c2 - c3 - c7' - c8' (client)
      \
        c4 - c5 - c6 (server)
```

**NB**: if the rebase of `extension` on `base` would not result in any commit
(`extension` and `base` pointing to the same commit), no commits will be added
onto `somewhere`.

Say a fix has been developed on the branch `fix`, and that the changes have
been incorporated in the `master` branch in some manner (merge, cherry-pick,
etc). Now we want to backport the fix to a previous point in the history, `v1`.

```
(v1)           (master)            (v1)           (master)
c1 - c2 - c3 - c4'                 c1 - c2 - c3 - c5
      \                   OR             \      /
        c4 (fix)                           c4 (fix)
```

In this case, running

```bash
git rebase --onto v1 master fix
```

will only move `fix` to `v1`.

```
(v1, fix)           (master)
c1 - c2 - c3 - c4'
```

The changes in `c4` will not be replayed on top of `c1`, because replaying
`fix` on `master` would not include `c4`, since it's already part of `master`.

Source:

- [Pro Git][pro-git]
- [experience][tekton-backports]
- [learning the hard way][backport-issue]

[pro-git]: https://git-scm.com/book/en/v2
[tekton-backports]: https://github.com/tektoncd/pipeline/pull/3958#issuecomment-849188512
[backport-issue]: https://github.com/eliasnorrby/tektoncd-helpers/issues/1
