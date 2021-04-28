---
subject: ansible
tags:
  - ansible
  - jinja
  - templating
snippets:
  - syntax: jinja2
    content: |-
      "{% raw %}{{.State}}{% endraw %}"
---

# Literal curly braces (raw)

Ansible makes heavy use of [Jinja][jinja-link] for templating. Notably,
variables can be referenced using double curly braces:

```yaml
name: "{{ app_name }}"
```

If we want to type literal double curly braces, e.g. for use in a `docker` or
`podman` format string, we can use a `raw` section:

```yaml
- name: Check if container is running
  command: podman ps -a --filter "name={{ app_name }}" --format "{% raw %}{{.State}}{% endraw %}"
  register: container_state
  changed_when: False
```

`{{ app_name }}` will be replaced with a variable value, while `{{.State}}`
won't be.

[jinja-link]: https://jinja.palletsprojects.com
