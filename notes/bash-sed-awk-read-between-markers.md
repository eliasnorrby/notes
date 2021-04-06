---
subject: bash
syntax: bash
tags:
  - scripting
  - sed
  - awk
snippet: |
  sed -n '/^---$/,/^---$/ { /^---$/d; p; }'
---

# Reading content between markers

Say we want to read some file contents between a set of markers, like the
frontmatter of a markdown document, for example:

*blog-post.md*
```md
---
title: My first blog post
tags:
  - blog
  - first
  - thing
---

# Welcome to my blog

Lots of interesting content.
```

We can use `sed` to read the content contained within the `---` markers with:

```bash
sed -n '/^---$/,/^---$/p' blog-post.md
```

We're telling `sed` to print all lines in the range defined by matches of the
pattern. If we want to exclude the markers themselves, we can delete them by
extending the command:

```bash
sed -n '/^---$/,/^---$/ { /^---$/d; p; }' blog-post.md
```

This works well for piping the output to another tool, like `yq`:

```bash
sed -n '/^---$/,/^---$/ { /^---$/d; p; }' blog-post.md | yq eval '.title' -
```

However, we run into problems if the marker used occurs in other places within
the document. In markdown, `---` can be used as a horizontal divider:

*blog-post.md*
```md
---
title: My first blog post
tags:
  - blog
  - first
  - thing
---

# Welcome to my blog

Lots of interesting content.

---

A completely separate topic.
```

If we want to only read the frontmatter, `awk` is more suitable. To start off
with, we can achieve something similar to the `sed` solution using a flag:

```bash
awk '/^---$/{flag =! flag; next}flag' blog-post.md
```

If we want to print only the frontmatter, we need something else:

```bash
awk '/^---$/{if (flag == 0) {flag = 1;next} else {exit}}flag' notes/bash-substring-contains.md
```

After reading the second occurence of the marker, `awk` will skip the rest of
the file.

## Side note

If the starting pattern and ending pattern are different, we can use another
solution:

```bash
awk '/start/{flag=1;next}/end/{flag=0}flag'
```
