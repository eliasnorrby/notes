---
subject: rust
tags:
  - rust
  - control-flow
  - shortcut
---

# Unwrapping a `Result`

Many functions in Rust have their return values wrapped in a [`result`][1]. The
`Result` type is an enum with two variants, `Ok` and `Err`.

```rust
let result = std::fs::read_to_string("test.txt");
```

It is common to have to handle these cases separately. One can use a `match`
statement, like so:

```rust
let content = match result {
  Ok(content) => content,
  Err(error) => panic!("Can't deal with: {}", error),
};
```

but this is in fact so common that there is a shortcut method called `unwrap`:

```rust
let content = result.unwrap();
```

## Returning and the question mark

If we don't want to panic (and exit), we can return an error instead:

```rust
let content = match result {
  Ok(content) => content,
  Err(error) => return Err(error.into()),
};
```

Just like calling `.unwrap()` on a `Result` is a shortcut for `match` with
`panic!` in the error arm, `?` is a shortcut for a `match` with a `return` in
the error arm:

```rust
let content = result?;
```

---

### Sources

- [Unwrapping][2]
- [Question mark][3]

[1]: https://doc.rust-lang.org/1.39.0/std/result/index.html
[2]: https://rust-cli.github.io/book/tutorial/errors.html#unwrapping
[3]: https://rust-cli.github.io/book/tutorial/errors.html#question-mark
