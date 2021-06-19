---
subject: make
tags:
  - make
  - build
snippets:
  - syntax: makefile
    content: |-
      SUBDIRS = scripts tekton
      TOPTARGETS = all lint test

      $(TOPTARGETS): $(SUBDIRS)

      $(SUBDIRS):
      	$(MAKE) -C $@ $(MAKECMDGOALS)

      .PHONY: $(SUBDIRS) $(TOPTARGETS)
---

# Running make in a set of subdirectories

```none
.
├── Makefile
├── scripts
│   └── Makefile
└── tasks
    └── Makefile
```

All Makefiles have `all`, `test` and `lint` targets.

```make
SUBDIRS = scripts tekton
TOPTARGETS = all lint test

$(TOPTARGETS): $(SUBDIRS)

$(SUBDIRS):
  $(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY: $(SUBDIRS) $(TOPTARGETS)
```

`$@` is an automatic variable that contains the target name (one of `SUBDIRS`
in this case).

Source: [stackoverflow][1]

[1]: https://stackoverflow.com/a/17845120
