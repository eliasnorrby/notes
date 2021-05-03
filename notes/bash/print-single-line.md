---
subject: bash
tags:
  - bash
  - sed
snippets:
  - syntax: bash
    content: |-
      sed '10q;d' file
  - syntax: bash
    content: |-
      sed "${linenr}q;d" file
---

# Print line at number

To print a line at a given position (say, line 10) within a file, we can use
this invocation of `sed`:

```bash
sed '10q;d' file
```

`d` means every line will be removed from the output, except for line 10, where
the deletion is short-circuited by quitting `q`. The result is that only line
10 is printed, and the rest of the file isn't processed.

An alternative is:

```bash
sed -n '10p' file
```

It is somewhat more intuitive, using `-n` to avoid printing lines, except for
line 10 which is explicitly printed. The drawback is that the entire file is
processed. Keep this in mind if performance is a priority.

[Source](https://stackoverflow.com/a/6022431)
