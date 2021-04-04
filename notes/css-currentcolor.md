---
subject: css
tags:
  - color
  - explicit
syntax: css
snippet: |
  border: 2px solid currentColor;
---

# The `currentColor` keyword

If we don't specify a color for a border, it will use the text's color by
default. If we want to make this explicit, we can use the `currentColor`
keyword:

```css
.box {
  color: royalblue;
  border: 2px solid currentColor;
}
```

This keyword can be used anywhere a color can be used, not just with borders.
