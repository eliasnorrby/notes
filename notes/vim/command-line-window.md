---
subject: vim
tags:
  - vim
---

# The command-line window

Sometimes (just like on the shell command-line), you're typing a command and
realize you have need for the full editing tools of a vim buffer. Enter: the
command-line window. Also known as "the thing that pops up when I try to quit
but mistype the keys `:q`".

Open the command-line window using:
- `ctrl-f` while on the command-line
- `q:` while in normal mode

This opens a window with your command history. If invoked from the command
line, the last line will contain the command typed thus far.

```vim
: w
: %s/foo/bar/g
: the command I was currently typing|
[Command Line]
```

Here, you can edit the current or a previous command, and execute the command
under the cursor with `CR`.

Source: `:help cmdline-window`
