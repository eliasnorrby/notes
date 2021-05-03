---
subject: bash
tags:
  - bash
  - trap
  - scripting
snippets:
  - syntax: bash
    content: |-
      cleanup() {
        rm some-temp-file-maybe
        exit 1
      }

      trap cleanup ERR SIGINT
---

# Run a function on interrupt or error

It is sometimes necessary for a script to clean up when exiting prematurely.
Perhaps some temporary files are written to, and the execution is halted due to
an error or a user interrupt (`ctrl-c`).

We can do so using `trap`:

```bash
cleanup() {
  rm some-temp-file-maybe
  # ... other actions
  exit 1
}

trap cleanup ERR SIGINT
```

We're tying the `cleanup` function to the signals `ERR` and `SIGINT`. This
function will be called if the script exits with a non-zero return code or if
it is interrupted using `ctrl-c`.

Source: `man trap`
