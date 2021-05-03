---
subject: git
tags:
  - git
snippets:
  - syntax: bash
    content: |-
      git log -L<start>:<end>:<file>
  - syntax: bash
    content: |-
      git log -L:<funcname>:<file>
---

# Viewing the evolution of a line or function

`git log`'s `-L` flag allows us to trace the evolution of a single line, a
range of lines, or a function.

## Line range

To view the history of a range of lines, specify `<start>:<end>` following
`-L`:

```bash
git log -L5,15:pom.xml
```

To view a single line, use the same line number for both `<start>` and `<end>`:

```bash
git log -L9,9:pom.xml
```

## Function

To view the history of a function, specify `:<funcname>` following `-L`, where
`<funcname>` is a regular expression.

```bash
git log -L:getUserById:path/to/my/Class.java
```

From the `git-log` manpage:

> The function names are determined in the same way as git diff works out patch
> hunk headers

This is, by default:

> ... a line that begins with an alphabet, an underscore or a dollar sign

This won't be approriate in many cases, particularly not in Java where methods
are members of classes, meaning they are indented. The default funcname regex
does not match any lines with leading whitespace. To change how hunk headers
are determined, we need to update `.gitattributes` within the project:

```ini
*.java  diff=java
```

We can define a custom regular expression that suits our purposes, but there
are a few built-in patterns to make this easier, and `java` is one of them, so
we're all set.

Sources:
`LESS='-p Defining a custom hunk-header' man gitattributes`
`LESS='-p -L<start>' man git-log`
