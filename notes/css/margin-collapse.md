---
subject: css
tags:
  - css
  - margin
---

# Margin-collapse

Margin-collapse is tricky.

## Only vertical margins collapse

Horizontal margins between columns do not collapse.

## Margins only collapse in Flow layout

If a container is using another layout, like `flex`, the margins of that
container's children won't collapse.

## Only adjacent elements collapse

Any additional element (be it an invisible and empty `<br />` tag) will prevent
margins from collapsing:

```html
<p>First</p>
<br />
<p>Second</p>
```

## The bigger margin wins

If elements specify different margins, the distance between them will be at
least as large as the biggest number.

## Nesting doesn't prevent collapsing

```html
<style>
  p {
    margin-top: 20px;
    margin-bottom: 20px;
  }
</style>

<div>
  <p>First</p>
</div>
<p>Second</p>
```

> Margin is meant to increase the distance between siblings. It is _not_ meant to
> increase the gap between a child and its parent's bounding box; that's what
> padding is for.

The margin of the inner paragraph is transferred to the parent element. The
effect would have been the same if the margin had been applied to the `<div>`
directly instead of the `<p>`.


... unless the `<div>` had some bottom padding. That would block
margin-collapse, as would a border. _Margins have to be touching to collapse_.

## Margins can collapse in the same direction

**A 0px margin is still a collapsible margin**

```html
<style>
  .blue {
    background-color: lightblue;
  }
  p {
    margin-top: 20px;
  }
</style>

<section class="blue">
  <p>Paragraph</p>
</section>
```

We might expect the blue background to extend above the text, but it does not.
Again, the purpose of margin is _not_ to increase the gap between a child and
its parent's bounding box. The margin specified is transferred to the parent,
overlapping with its `0 px` margin.

## More than two margins can collapse

With the largest one winning, as seen previously.

## Negative margins

Negative margins can pull elements, making neighbours overlap.
