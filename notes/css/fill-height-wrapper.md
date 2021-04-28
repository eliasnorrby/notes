---
subject: css
tags:
  - css
  - footer
snippets:
  - syntax: css
    content: |
      html, body {
        height: 100%;
      }

      .wrapper {
        min-height: 100%;
      }
  - syntax: css
    content: |
      html, body {
        height: 100%;
      }

      .wrapper {
        display: flex;
        flex-direction: column;
        min-height: 100%;
      }

      .footer {
        margin-top: auto;
      }
---

# Wrapper taking up at least 100% height

Height is different to width in that, whereas the default width behaviour is to
fill the available space, the default height behaviour is to be as small as
possible.

A common source of frustration is to make an element take up _at least_ 100% of
the available height (say, to position a footer at the bottom of a page,
regardless of the content's length).

```css
html, body {
  height: 100%;
}

.wrapper {
  min-height: 100%;
}
```

## Why not `vh`?

The `vh` unit, or viewport height, appears to be designed exactly for this
purpose. However, it leads to some unfortunate effects, especially on mobile
devices. Because the address bar and footer controls on mobile browsers will
slide away as the user scrolls, the viewport height changes. These browsers
will set `vh` equal to the _maximum viewport height_, after scrolling, which
won't match the viewable area when the controls are visible.

## Footer at the bottom

A max height wrapper is a pre-requisite for positioning a footer at the bottom
of the page. To do it, we can use flexbox:

```css
html, body {
  height: 100%;
}

.wrapper {
  display: flex;
  flex-direction: column;
  min-height: 100%;
}

.footer {
  margin-top: auto;
}
```

```html
<div class="wrapper">
  <p>
    Content
  </p>
  <footer>At the bottom</footer>
</div>
```

[Source](https://courses.joshwcomeau.com/css-for-js/01-rendering-logic-1/11-height)
