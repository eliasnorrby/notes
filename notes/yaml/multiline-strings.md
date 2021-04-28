---
subject: yaml
tags:
  - yaml
snippets:
  - syntax: yaml
    content: |-
      multiline: >
        this will
        be a single
        line
  - syntax: yaml
    content: |-
      multiline: |
        with a | the newlines
        will be preserved
---

# Yaml multiline strings

First, decide whether you want to fold newlines or preserve them using the
_Block Style Indicator_. There are two options:

- The literal style (`|`) will preserve newlines
- The folded style (`>`) will replace newlines with spaces

(To get a newline using the folded style, use a blank line (two newlines).)

```yaml
multiline: >
  this will
  be a single
  line

  but this will be a
  separate one
```

```yaml
multiline: |
  these newlines
  will be preserved
```

Then there are options for newlines at the end:

- `|-` will strip newlines
- `|+` will keep all trailing newlines
- `|` (specifying nothing) will leave a single newline

These options are available both in the folded and the literal style.

[Source][1]

[1]: https://yaml-multiline.info/
