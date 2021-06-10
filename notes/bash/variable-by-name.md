---
subject: bash
tags:
  - bash
  - parameter-expansion
snippets:
  - syntax: bash
    content: |-
      echo "${!varname}"
---

# Reference variable by name

In bash, one can use the syntax `${!varname}` to expand the value of the variable with the name `$varname`.

```bash
PARAM_REV=master
varname=PARAM_REV
echo $varname
# PARAM_REV
echo ${!varname}
# master
```

Source:
- `LESS='-p Parameter Expansion' man bash`
