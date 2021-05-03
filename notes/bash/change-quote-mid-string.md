---
subject: bash
tags:
  - bash
  - string
---

# Change quote style mid-string

When building a string in bash, we're not limited to one type of quotes (i.e.
single `'` or double `"` quotes) - you can switch mid string. This is
especially useful if we require double quotes for part of the string to
interpolate a variable, but using double quotes for the entire string would
require many other characters to be escaped.

Say we have this `grep` command for finding `yaml` code blocks within a
markdown file:

```bash
grep -E '^[[:space:]]*```ya?ml[[:space:]]*$' example.md
```

If we want to use a variable for the language part, we can use double quotes
for just that part of the string, eliminating the need to escape the backticks:

```bash
language='ya?ml'
grep -E '^[[:space:]]*```'"$language"'[[:space:]]*$' test/assets/example.md
```
