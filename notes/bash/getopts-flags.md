---
subject: bash
snippets:
  - syntax: bash
    content: |-
      ERROR="Bad usage, see ${0##*/} -h"

      read -r -d "" USAGE <<EOF
      Short description

      Usage: ${0##*/} [-fh]
        -f ARG      Do something
        -h          Show usage

      Example:
        ${0##*/} -f my-arg

      EOF

      set -eo pipefail

      if [ "$1" = "--help" ]; then
        echo "$USAGE" && exit 0
      fi

      while getopts f:h opt; do
        case $opt in
          f) VAR=$OPTARG                         ;;
          h) echo "$USAGE" && exit 0             ;;
          *) echo "$ERROR" && exit 1             ;;
        esac
      done

      POS_ARG=${*:$OPTIND:1}

      OTHER_ARGS=${*:$OPTIND+1}

      if [ -n "$OTHER_ARGS" ]; then
        echo "ERROR: Unprocessed positional arguments: $OTHER_ARGS"
        exit 1
      fi
---

# Getopts

Here's a useful pattern for collecting command line options in a script:

```bash
ERROR="Bad usage, see ${0##*/} -h"

read -r -d "" USAGE <<EOF
Short description

Usage: ${0##*/} [-fh]
  -f ARG      Do something
  -h          Show usage

Example:
  ${0##*/} -f my-arg

EOF

set -eo pipefail

if [ "$1" = "--help" ]; then
  echo "$USAGE" && exit 0
fi

while getopts f:h opt; do
  case $opt in
    f) VAR=$OPTARG                         ;;
    h) echo "$USAGE" && exit 0             ;;
    *) echo "$ERROR" && exit 1             ;;
  esac
done
```

I like to combine this with a check for superfluous positional arguemnts:

```bash
POS_ARG=${*:$OPTIND:1}

OTHER_ARGS=${*:$OPTIND+1}

if [ -n "$OTHER_ARGS" ]; then
  echo "ERROR: Unprocessed positional arguments: $OTHER_ARGS"
  exit 1
fi
```

If you only expect a specific number of positional arguments, this is a good
safety measure, because it reduces the risk of missing important options.
Because `getopts` will stop processing options as soon as it hits a positional
argument, in a case like this:

```bash
$ ./my_script.sh -f f_arg pos_arg -h
```

the `-h` flag will be ignored. Imagine it being a dry-run toggle, for example -
better to quit than to miss that.
