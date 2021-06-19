---
subject: ngrok
tags:
  - webhook
  - ngrok
snippets:
  - syntax: bash
    content: |-
      ngrok http 80 --log=stdout >/dev/null &
      PUBLIC_URL=$(curl -sS http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')
---

# Running ngrok in the background

By default, `ngrok` launches an interactive session. This is great for local
development, but not if we're using it in an automated fashion (e.g. in CI). We
can use this method to run `ngrok` in the background, and to acquire the
randomly generated public url:

```bash
# run ngrok in the background
ngrok http 80 --log=stdout >/dev/null &
# get the public url
PUBLIC_URL=$(curl -sS http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')
```

Source: [ngrok/issues/57][1]

[1]: https://github.com/inconshreveable/ngrok/issues/57
