---
subject: css
snippets:
  - syntax: css
    content: |-
      *,
      *::before,
      *::after {
        box-sizing: border-box;
      }
---

# `box-sizing: border-box`

The default value for `box-sizing` is `content-box`, which means that sizes
apply to an element's content. For example:

```html
<style>
  section {
    width: 150px;
  }

  p {
    width: 100%;
    padding: 16px;
    border: 2px solid;
    /* Toggle this on and off in the devtools! */
    /* box-sizing: border-box; */
  }
</style>

<section>
  <p>Hello World</p>
</section>
```

With `box-sizing: content-box;`, the rectangle defined by the black border will
be 186px wide: the content is set to be 150px, with the padding and border
being added on top of that. With `box-sizing: border-box;`, the size
calculations are done with regards to the border instead. To set this as the
default for all elements, include this snippet in your global styles:

```css
*,
*::before,
*::after {
  box-sizing: border-box;
}
```
