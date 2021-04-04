---
subject: css
syntax: css
tags:
  - margin
  - layout
  - centering
snippet: |
  margin-left: auto;
  margin-right: auto;
---

# Using `margin: auto;` for centering

In addition to specifying explicit values for `margin`, we can use the keyword
`auto`.

```css
.centered {
  margin-left: auto;
  margin-right: auto;
}
```

The browser will seek to fill the maximum available space by applying the same
margin on the left and right sides of the element. This has the side-effect of
centering the element: neat!

There are two caveats:

- It only works for horizontal margin
- It only works on elements with an explicit width

With *grid* and *flexbox*, we have other ways of centering elements, but the
`margin: auto` trick is especially useful because it can be selectively applied
to a single element on a page.
