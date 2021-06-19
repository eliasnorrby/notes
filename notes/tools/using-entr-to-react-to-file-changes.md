---
subject: tools
tags:
  - entr
  - auto-reload
snippets:
  - syntax: bash
    content: |-
      find . -type f -name '*.c' | entr make build
  - syntax: bash
    content: |-
      echo my_script.sh | entr /_
---

# Using entr to react to file changes

[`entr`][entr-github] is "A utility for running arbitrary commands when files
change". It's available on both Linux and MacOS.

```bash
# Run make build when source files change
find . -type f -name '*.c' | entr make build
```

`/_` is a shorthand that is replaced with the absolute path of the first file
to trigger an event.

```bash
# Run my_script.sh on save
echo my_script.sh | entr /_
```

[entr-github]: https://github.com/eradman/entr
