---
subject: typescript
tags:
  - typescript
snippets:
  - syntax: typescript
    content: |-
      type Unarray<T> = T extends Array<infer U> ? U : T
---

# Inferring the type of elements in an array

```typescript
type Unarray<T> = T extends Array<infer U> ? U : T
```
