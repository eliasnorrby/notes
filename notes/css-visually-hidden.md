---
subject: css
tags:
  - a11y
  - accessibility
snippets:
  - syntax: css
    content: |
      .visually-hidden:not(:focus):not(:active) {
        clip: rect(0 0 0 0);
        clip-path: inset(50%);
        height: 1px;
        overflow: hidden;
        position: absolute;
        white-space: nowrap;
        width: 1px;
      }
---

# Hiding elements

We can use `display: none;` to hide elements, but that can cause problems for
people with screen readers. If we want to hide an element visually, but have
them available for assistive technologies, we can use a rule like this one:

```css
.visually-hidden {
  clip: rect(0 0 0 0);
  clip-path: inset(50%);
  height: 1px;
  overflow: hidden;
  position: absolute;
  white-space: nowrap;
  width: 1px;
}
```

[Source](https://www.a11yproject.com/posts/2013-01-11-how-to-hide-content/)
