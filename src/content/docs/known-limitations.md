---
title: "Known limitations"
lede: "What Runebender currently supports and what its checks do not prove."
status: "Alpha"
stability: "Check the current release and source for updates"
order: 25
description: "Current platform, browser, format, and agent boundaries."
---

Runebender is experimental.
Keep font sources in version control and work on copies when evaluating a new build.

## Platforms and input

Native Linux and macOS compile, lint, document, and test in CI.
Most hands-on interaction work has been on macOS; Linux pointer, IME, file-dialog, accessibility, and GPU combinations need more supervised checks.
The Windows build and headless commands have passed basic checks, but native startup has failed in the [Windows workflow](https://github.com/eliheuer/runebender-xilem/actions/workflows/windows.yml).
The live editor endpoint uses Unix sockets and is unavailable on Windows.
Headless file commands remain portable.

## Browser

The browser build reuses the Xilem/Masonry interface and edits a bundled font in memory.
Reloading discards edits.
Opening or saving arbitrary user sources, native accessibility forwarding, local subprocesses, and native live-agent access require the desktop application.
Chromium tests do not certify Safari, Firefox, platform IMEs, or native GPU behavior.

## Font formats

The canonical Project owns editable glyph and source data, with UFO-only values preserved at explicit adapter boundaries.
Unsupported Designspace extensions, discrete axes, cross-axis mappings, anisotropic locations, and layer-only UFOs without a full source fail explicitly.
Interpolation requires compatible contours, components, and anchors.
Auxiliary layers are editable but do not automatically become interpolation sources.
The compiler emits TrueType variations; VARC and exhaustive UFO/OpenType metadata parity are not claimed.
See [Source format preservation](/docs/source-format-allowlist.html) for the accepted field families.

## Agent and proof checks

The live endpoint reads the unsaved canonical document, but unfinished pointer gestures are private until committed.
Receipt-backed edits are bounded to one explicit source and their receipts last only for that document lifetime.
A successful proof transport does not establish that a particular model received or interpreted the image.
Use connected MCP `tools/list` for exact tool schemas and [MCP](/docs/mcp.html) for the workflow.
