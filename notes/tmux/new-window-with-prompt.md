---
subject: tmux
tags:
  - tmux
  - fzf
---

# New window with prompt

For the longest time, I've hade the following binding in my `tmux.conf`:

```tmux
bind c new-window -c "#{pane_current_path}" \; command-prompt -p " Window name:" -I "#{window_name}" "rename-window '%%'"
```

A new window is created, using the same path as my current pane, and I'm
presented with a prompt to give the window a meaningful name, with the default
being 'zsh'. This is great when I need another window for the project I'm
working on, but falls a little short when I want to navigate to a new project.

I frequently use [`z`][github-z] with [`fzf`][github-fzf] to navigate to
project directories. When opening a window for a separate project, I end up
going through these steps:

- Hit `prefix + c`
- Type the name of the project (to name the window)
- Type `z <project name>` to navigate to the project directory

I want to eliminate the need to type the project name twice and came up with
this mapping:

```tmux
bind z new-window \; command-prompt -p " Window name:" "rename-window '#{?#{!=:%1,''},%1,zsh}' \; send-keys z ' %1' C-m"
```

Here, we're reading the project name with `command-prompt`, using the input as
the window name (unless it's blank, in which case we use a format conditional
to substitute 'zsh' as a default name). The input is also used in a send-keys
command to execute `z` when the shell loads, navigating to the project
directory.

[github-z]: https://github.com/rupa/z
[github-fzf]: https://github.com/junegunn/fzf
