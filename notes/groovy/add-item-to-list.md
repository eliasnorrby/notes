---
subject: groovy
tags:
  - groovy
  - append
  - list
snippets:
  - syntax: groovy
    content: |
      list << "item"
---

# Appending items to a list

There are multiple ways of adding items to a list in groovy. One of them is
using the `<<` operator:

```groovy
def list = []
list << "item"
```

Another is using `+` or `+=`:

```groovy
list += "a" + ["b", "c", "d"]
```

`<<` is mutating while `+=` is not - it creates a new list.

[Source](http://docs.groovy-lang.org/next/html/documentation/working-with-collections.html#_adding_or_removing_elements)
