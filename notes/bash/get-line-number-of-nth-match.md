---
subject: bash
tags:
  - scripting
  - grep
  - awk
snippets:
  - syntax: bash
    content: |-
      awk '/PATTERN/ && (++c == NUM) { print NR; exit }' INPUT
---

# Getting the line number of the nth match

If we're aiming to find the line number of the nth match, we might think to use
`grep` and parse it's output.

Take this markdown document for example, where we want to find the line number
of the second occurrence of `---`:

*input.md*
```md
---
title: some frontmatter
--- <-- We want the line number of this line

# Some content
```

```bash
grep '^---$' -m 2 -n input.md | tail -1 | cut -d ":" -f 1
```

This gets the job done, but it invokes a number of subshells, reducing
performance. An alternative using `awk` may be less I/O intensive:

```bash
awk '/^---$/ && (++c == 2) { print NR; exit }' input.md
```

[Source](https://stackoverflow.com/questions/57044203/how-to-get-the-line-number-of-nth-match#comment100617725_57044437)
