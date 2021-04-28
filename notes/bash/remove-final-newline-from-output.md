---
subject: bash
tags:
  - bash
  - head
snippets:
  - syntax: bash
    content: |-
      head -c -1
---

# Remove final newline

We can use `head` with the `-c` or `--bytes` flag to remove a number of bytes from the end.

> ```
> -c, --bytes=[-]NUM
>      print the first NUM bytes of each file; with the leading '-', print all but the last NUM bytes of each file
> ```

So, if we want to remove a single newline from the input (or any character for that matter):

```bash
$ echo "stuff" | head -c -1
```
