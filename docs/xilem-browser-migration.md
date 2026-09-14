# Xilem browser migration

Checked 2026-09-13 against runebender-xilem `892f7fb`, upstream Xilem
`b81d8d7a`, and the application's lockfile (Tokio 1.53.1).

## Decision and current release boundary

Runebender's public identity and installation point to runebender-xilem.
The browser replacement is required. Keep existing screenshots unchanged
at the user's request. The main action links to desktop installation until
there is a verified Xilem browser artifact. Existing browser bundles remain
available at their old URLs but are not linked as the current editor.

## Verified first blocker

In the application checkout:

```sh
cargo check --locked --target wasm32-unknown-unknown
cargo tree --locked --target wasm32-unknown-unknown -e features -i tokio
```

The check fails inside Tokio with:

```text
Only features sync,macros,io-util,rt,time are supported on wasm.
```

Both upstream `xilem/Cargo.toml` and `xilem_masonry/Cargo.toml` unconditionally
enable `rt-multi-thread`. Disabling Xilem's default features does not remove
it. This is a framework dependency blocker, not just an application feature.

A minimal reproducer, independent of Runebender:

```toml
[package]
name = "runebender-xilem-web-probe"
version = "0.0.0"
edition = "2024"
publish = false

[dependencies]
xilem = { git = "https://github.com/linebender/xilem", rev = "b81d8d7a", default-features = false }
```

With `src/main.rs`:

```rust
fn main() {
    let _ = xilem::view::label("Runebender browser probe");
}
```

Run `cargo check --target wasm32-unknown-unknown`. This minimal package
also failed at Tokio. The checks were run offline with cached dependencies;
the application lockfile seeded the probe's resolution. This proves the
first compile blocker, not an exhaustive list of failures.

## Next implementation milestone

Establish a supported browser runtime and window/rendering path in upstream
Xilem/Masonry. The pinned Xilem startup constructs `TokioRuntime::new()`;
Masonry's window runner blocks on GPU surface creation using `pollster`.
Both need browser-aware investigation, not just deletion of a Cargo feature.
Use an isolated upstream experiment for that work; do not change the native
application's dependency pin before a browser proof works.

Then adapt Runebender's native dialogs, menus, clipboard, file watching, and
process integrations. Prefer reusing the existing Masonry interface; a DOM
backend is a different implementation decision, not a drop-in widget port.

## Replacement acceptance

- Render the existing interface in an actual browser with a bundled sample font.
- Edit a glyph, undo/redo, export it, and reopen the exported source.
- Open user-selected sources without modifying their originals implicitly.
- Verify keyboard focus, text input/IME, clipboard, panel resizing, and scrolling.
- Verify rendering on the intended desktop browsers and report unsupported devices.
- Establish hosting requirements from the selected renderer/runtime; do not assume
  older service-worker or shared-memory requirements still apply.
- Build a reproducible artifact for `/editor/`, update the site action, and only
  then redirect old editor URLs. Do not infer browser parity from native captures.

No application source, dependency pins, screenshots, or published artifacts
were changed by this investigation.
