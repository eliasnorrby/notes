---
subject: rust
tags:
  - rust
  - control-flow
snippets:
  - syntax: rust
    content: |-
      match result {
        Ok(content) => handle(content),
        Err(error) => panic!("Or handle otherwise: {}", error),
      }
---

# The `match` operator

A powerful tool for handling control flow in Rust is the `match` operator. It
compares a value against a set of patterns and executes code based on which
pattern matches.

```rust
match result {
  Ok(content) => handle(content),
  Err(error) => panic!("Can't deal with: {}", error),
}
```

> "The power of match comes from the expressiveness of the patterns and the
> fact that the compiler confirms that all possible cases are handled."

[Source][1]

[1]: https://doc.rust-lang.org/1.39.0/book/ch06-02-match.html
