---
subject: vim
tags:
  - vim
  - linting
  - eslint
snippets:
  - syntax: vim
    content: |-
      set makeprg=npx\ eslint\ -f\ unix\ --quiet\ 'src/**/*.{js,ts,jsx,tsx}'
---

# Populate quickfix list with eslint errors

Set the `makeprg` to `eslint`:

```vim
set makeprg=npx\ eslint\ -f\ unix\ --quiet\ 'src/**/*.{js,ts,jsx,tsx}'
```

Then run `make` to populate the quickfix list.

Source: [til.hashrocket.com](https://til.hashrocket.com/posts/bkeplhlekr-fill-your-quickfix-window-with-lint)
