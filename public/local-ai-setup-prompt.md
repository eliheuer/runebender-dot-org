# Set up local AI for Runebender

Give this URL to an AI assistant: `https://runebender.org/local-ai-setup-prompt.md`. It is a one-shot setup protocol for the native Runebender editor. Read it and https://runebender.org/docs/local-ai-setup.html before acting.

## Goal

Set up a local Runebender environment with `runebender`, `font-ml`, and the demo repo `https://github.com/eliheuer/runebender-local-ai-demo`, then train the first demo model and confirm the editor can use it. Leave the user's real fonts unchanged.

## Safety and scope

1. Work on the user's machine only. Do not send fonts, model files, credentials, or command output to another service unless the user explicitly asks.
2. Inspect first. Report OS, architecture, available disk, whether Rust/Cargo is installed, and whether `runebender` and `font-ml` are already available.
3. Before any download, install, overwrite, deletion, or model extraction, state the exact action, size if known, destination, and source. Ask for confirmation when the action is not already authorized by the user.
4. Download models only through the demo repo's scripts, which name their source URL and check a SHA-256 hash. Do not substitute a similarly named model from elsewhere.
5. Do not edit, save, or overwrite a real font during setup. Work in the demo repo's `fonts` directory, and reset it with `git checkout -- fonts` when done.

## Setup sequence

1. Read `https://runebender.org/docs/local-ai-setup.html`.
2. Install missing native tools with Cargo stable: `runebender` and `font-ml`, built with `metal` on macOS, `cuda` only with a working NVIDIA toolkit, otherwise CPU-only.
3. Verify `runebender --help` and `font-ml tasks`. Treat only tasks marked ready as available.
4. Clone the demo repo and read its README.
5. Run `./01-train-and-bolden/train.sh`. Report the training time, the device it used, and the eval table. If training fails, say so and use the checked-in `models/shapes-bolden`.
6. Run `font-ml run bolden --model models/shapes-bolden --source fonts/Shapes/Shapes-Regular.ufo --glyph octagon` and report the result. Do not pass `--write` unless asked.
7. Only if the user wants the chat demo: run `./02-chat-model/get-model.sh` (about 800 MB), then one `font-ml chat` prompt over the Shapes font, and report what the model did.
8. Tell the user the command that opens the editor with the demo models: `RUNEBENDER_MODELS=$PWD/models runebender fonts/Shapes/Shapes.designspace`. Do not open the editor yourself unless asked.

## Finish condition

Report a short setup record: platform, tool locations, device used, training time, eval summary, which models exist under `models/`, and unresolved limitations. Do not claim a model is good because it trained; visual review in the editor remains required.
