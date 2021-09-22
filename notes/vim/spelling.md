---
subject: vim
tags:
  - vim
  - writing
---

# Spelling

Here are some useful commands and bindings for making use of vim's spell checking:

- `:set spell` enables spelling checking
- `]s` and `[s` navigates between misspelled words
- `z=` brings up a list of suggestions to replace a misspelled word

Calling `z=` with a count (i.e. `1z=`) will select that suggestion without prompting.

Source: `:h spell`
