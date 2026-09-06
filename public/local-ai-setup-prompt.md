# Set up local AI for Runebender

Give this URL to an AI assistant: `https://runebender.org/local-ai-setup-prompt.md`. It is a one-shot setup protocol for the native Runebender editor. Read it and https://runebender.org/docs/local-ai-setup.html before acting.

## Goal

Set up a local Runebender workshop environment with the native editor, `runebender-core`, `font-ml`, and verified local model files. Use the common default model root `~/.runebender/models`. Leave the user's real font unchanged.

## Safety and scope

1. Work on the user's machine only. Do not send fonts, model files, credentials, or command output to another service unless the user explicitly asks.
2. Inspect first. Report OS, architecture, available disk, whether Rust/Cargo is installed, and whether `runebender-gpui`, `runebender-core`, and `font-ml` are already available.
3. Before any download, install, overwrite, deletion, or model extraction, state the exact action, size if known, destination, and source. Ask for confirmation when the action is not already authorized by the user.
4. Never substitute an unknown internet model for the workshop bundle. Ask for the organizer-provided archive/directory and SHA-256 checksum if they were not supplied.
5. Do not edit, save, or overwrite a real font during setup. Use the supplied demo font or a disposable copy.

## Setup sequence

1. Read `https://runebender.org/agent-capabilities.json` and `https://runebender.org/docs/local-ai-setup.html`.
2. Create `~/.runebender/models` if it does not exist. Do not configure an override unless the user explicitly chose a different shared location.
3. Install missing native tools with Cargo stable: `runebender-gpui`, `runebender-core`, and `font-ml`, built with `metal` on macOS, `cuda` only with a working NVIDIA toolkit, otherwise CPU-only.
4. Verify command discovery and inspect `font-ml tasks --json`. Treat only tasks whose `implemented` field is true as available.
5. Verify the organizer's model bundle checksum, then put its model directories directly under `~/.runebender/models`: chat is `.gguf` plus `tokenizer.json` in `runebender-workshop-4b`; the outline model is `config.json`, `weights.safetensors`, and `vocab.txt` in `runebender-workshop-bolden`.
6. Restart the editor and run a smoke test on a disposable/demo font: local chat reads a known glyph and generates a proof without installation or saving; the outline model runs one `bolden --write` proposal on one glyph; report model paths, device, command results, and failures.
7. After the smoke test, copy `https://runebender.org/design-brief-template.md` to the real font repository as `DESIGN.md`. Read that file before any design task.

## Finish condition

Report a short setup record: platform, tool locations, active model root, model directory names, checksum result, tasks with `implemented: true`, smoke-test result, and unresolved limitations. Do not claim a model is good because it loaded; visual review remains required.
