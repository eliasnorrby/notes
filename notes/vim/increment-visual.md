---
subject: vim
tags:
  - vim
---

# Visual increment

Vim's increment (`CTRL-A`) can be used on a visual selection for more control.
One could, for example, only increment the first digit in a series of numbers.

To create an incrementing sequence, select multiple lines and use `g CTRL-A`. This can also be used with a count. Use `g CTRL-A` to turn:

```
0
0
0
0
0
```

into:

```
1
2
3
4
5
```

or `10g CTRL-A` to turn it into:

```
10
20
30
40
50
```

Source:
- `:h CTRL-A`
- `:h v_g_CTRL-A`
