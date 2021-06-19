---
subject: make
tags:
  - make
  - build
snippets:
  - syntax: make
    content: |-
      action:
        command $(filter-out $@,$(MAKECMDGOALS))

      %:
        @:
---

# Passing arguments to make rules

A word of caution: this sort of goes against how `make` is intended to be used.
But it can be convenient, and fun.

```make
action:
  @echo command $(filter-out $@,$(MAKECMDGOALS))

%:
  @:
```

Example call:

```bash
make action arg1 arg2
```

- `$(MAKECMDGOALS)` is the list of targets passed to make (`action arg1 arg2`)
- `$@` is an automatic variable expanding to the name of the target rul (`action`)
- `filter-out` is a function that removes items from a list: `filter-out $@,$(MAKECMDGOALS) -> arg1 arg2`
- `%` is a wildcard. If no rule is matched (as for `arg1` and `arg2` in the example), this goal will be run
- `:` is a no-op. It means "do nothing", like the bash equivalent
- `@` in front of a recipe makes it silent

The result is that `command` will be invoked as: `command arg1 arg2`. `make`
will still recognize `arg1` and `arg2` as targets, but will run the wildcard
rule for them, silently doing nothing.

A side effect of the wildcard target is that `make` won't complain if we pass
an invalid target - it will just silently do nothing:

```bash
make non-existing targets
```

And if one of the arguments we want to pass to `command` also is the name of
another target, recipes in that rule will be executed as well - which probably
is not somehting we want.

Source: [stackoverflow][1]

[1]: https://stackoverflow.com/a/6273809
