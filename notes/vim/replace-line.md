---
subject: vim
tags:
  - search
  - replace
snippets:
  - syntax: vim
    content: |-
      %s/^pattern/put this above\r&/
---

# Insert line above matched line

When used in a substitution command, `&` is replaced by the text that matches
the search pattern. If we match a pattern from the beginning of a line, we can
insert something above it by replacing the match with the new content, a line
break and the matched pattern.

```ts
export class MyClass {
  property: string;
}
```

```vim
:%s/^export class/\/\/ This is a class\r&/
```

```diff
+ // This is a class
  export class MyClass {
    property: string
  }
```

Source: `:h &`
