---
subject: git
tags:
  - config
  - work
snippets:
  - syntax: conf
    content: |
      [includeIf "gitdir:work/"]
        path = config-work
---

# Conditional git config includes

Sometimes we want to use different git configurations for different
sub-directories. For client work, for example, we might want to use another
email address for our commits. While this could be accomplished by modifying
the local git configuration in each repository, there is another way to solve
the problem in one stroke: conditional includes.

Using the `include` keyword, we can include other configuration files. With
`includeIf`, we can supply a condition that must be met. There are many
options, but one of the most useful ones is `gitdir`. If all work related
projects are contained in a directory called `work` (be that in `~/work` or
`~/dev/work` or somewhere else entirely), we can use this statement to include
work-specific configuration for those projects:

```conf
[includeIf "gitdir:work/"]
  path = config-work
```

The path to the config file to include is relative to the main configuration
file, unless an absolute path is given. Within it, we can override settings
from the main file, e.g.:

```conf
[user]
  email = me@work.com
```

Source: `man git-config`
