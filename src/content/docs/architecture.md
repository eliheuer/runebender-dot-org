---
title: "Architecture"
lede: "One application package with a reusable font engine and a shared browser view tree."
status: "Alpha"
stability: "Verify file paths against the current source"
order: 26
description: "The Runebender source map and ownership boundaries."
---

Runebender's root `runebender` Cargo package builds the native editor, headless commands, and font-engine library.
The separate `web/` Cargo workspace reuses the application view tree with an in-memory browser host.
Sibling repositories are independent projects.

## Source map

| Path | Responsibility |
| --- | --- |
| `src/lib.rs` | Font-engine module root. |
| `src/main.rs` | Executable composition root. |
| `src/font/` | Canonical `Project`, source operations, history, persistence, interpolation, and compilation. |
| `src/outline/`, `src/text/`, `src/analysis/` | Reusable geometry, shaping, and measurement. |
| `src/formats/` | Source-format adapters and persistent metadata. |
| `src/automation/` | Agent and live-editor operation contracts. |
| `src/workflows/`, `src/ui/` | Saved workflows and toolkit-independent editor data. |
| `src/application/editor/` | User intent, commands, sessions, and tools. |
| `src/application/view/` | Xilem views, panels, canvas, themes, and design tokens. |
| `src/application/platform/` | Files, dialogs, watching, live IPC, and screenshots. |
| `web/` | Browser host for the shared widgets. |

Read the relevant module header before changing code.
The repository's `AGENTS.md` carries local working rules and validation constraints.

## Ownership

`font::project::Project` is the authoritative in-memory document.
Babelfont owns canonical glyph geometry.
Stable layer and object identities retain exact UFO-only values that Babelfont cannot express.
Norad values are constructed at explicit import, export, and serialization boundaries; they are not a second live font model.

Views read workspace state and dispatch commands.
Application editor code interprets gestures and user intent.
Reusable font behavior belongs in the engine, which has no Xilem, Masonry, dialog, or window dependency.
Native and browser editing use the same canonical operations.

## Change routing

| Change | Start with |
| --- | --- |
| Editor tool or shortcut | `src/application/editor/tools/`, `src/application/actions.rs` |
| Canvas or panel | `src/application/view/canvas/`, `src/application/view/panels/` |
| Theme or reusable control | `themes/builtin/`, `src/application/view/theme.rs`, `design.rs`, `recipes.rs` |
| Glyph outline or interpolation | `src/outline/`, `src/font/` |
| UFO or Designspace preservation | `src/font/persistence/`, `src/formats/` |
| Live agent tool | `src/automation/`, `src/application/platform/live*.rs` |
| Browser behavior | `web/`, then the shared application source |

The full file tree is in the [source repository](https://github.com/eliheuer/runebender-xilem).
For build checks and interface work, see [Development](/docs/development.html) and [Design principles](/docs/design-principles.html).
