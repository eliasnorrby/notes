---
subject: git
tags:
  - git
  - vcs
snippets:
  - syntax: conf
    content: |-
      package-lock.json -diff
---

# Hide file from git diff output

`git diff` will show patches for text files, but not for binary files, like
images, because the output is not likely to make any sense. Some checked in
text files, like `package-lock.json`, can be considered binary too: while
technically composed of text characters, it's opaque to a human reader. In
addition to that, it's diff output long, and commonly fills the entire screen
when running `git diff`. To avoid this, we can mark the file as binary by
unsetting the diff attribute in `.gitattributes`:

```conf
package-lock.json -diff
```

Source: `LESS='-p Marking files as binary' man gitattributes`
