---
subject: zsh
tags:
  - zsh
  - shell
---

# Lazy loading command setup

This is a pattern one can use to post-pone expensive setup calls, shortening
shell startup time:

```zsh
if [ $commands[kubectl] ]; then
  kubectl() {
    unfunction "$0"
    source <(kubectl completion zsh)
    $0 "$@"
  }
fi
```

However, the `zsh` completion system seems sofisticated enough to handle this
out of the box, as long as completion scripts are supplied in the correct way.
Take a look in `/usr/share/zsh/site-functions`.

A similar pattern can be used to load tools like `nvm` on demand:

```zsh
nvm() {

  unfunction "$0"

  [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
  source /usr/share/nvm/nvm.sh
  source /usr/share/nvm/install-nvm-exec

  $0 "$@"
}
```

[Source][1]

[1]: https://frederic-hemberger.de/notes/shell/speed-up-initial-zsh-startup-with-lazy-loading/
