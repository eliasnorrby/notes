---
subject: vim
tags:
  - vim
  - linting
  - tsc
  - typescript
snippets:
  - syntax: vim
    content: |-
      set errorformat=%f\\(%l\\,%c\\):\ error\ %m makeprg=npx\ tsc\ --noEmit\ --pretty\ false
---

# Populate quickfix list with tsc errors

Customize `errorformat` and set `makeprg` to `tsc`:

```vim
set errorformat=%f\\(%l\\,%c\\):\ error\ %m
set makeprg=npx\ tsc\ --noEmit\ --pretty\ false
```

Then run `make` to populate the quickfix list.
