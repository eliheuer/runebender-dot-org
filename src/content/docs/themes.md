---
title: "Themes"
lede: "Make, install, and share Runebender themes with the Base UI and Rainbow palettes."
status: "Alpha"
stability: "Verify details against the current source"
order: 23
description: "Make, install, and share Runebender themes with the Base UI and Rainbow palettes."
---

A Runebender theme is one portable `.theme.toml` file.
The bundled themes are in [assets/themes/default](https://github.com/eliheuer/runebender-xilem/tree/main/assets/themes/default).
The native editor reads installed files at startup; the browser bundles the three built-in themes.
The format has `formatVersion = 1` so future versions can change without guessing how to read an older file.
Existing `.theme.json` files still load.

## The two palettes

| Name | TOML section | What to say when requesting a change |
| --- | --- | --- |
| **Base UI** | `baseUi` | “Make Base UI 07 warmer.” Ten numbered stops, 00–09, progress from darkest to lightest in the built-in themes. A custom theme can tint or replace each stop. |
| **Rainbow** | `rainbow` | “Change Rainbow red.” Red, orange, yellow, green, blue, purple, and pink are stable mark categories; teal is also available for editor roles. Each hue has `dim`, `base`, `bright`, and `deep` steps. |

`surfaces`, `text`, and `roles` say where those palette colors are used.
For example, `gray.roles.pointSmooth` is `rainbow.blue.base`, while `gray.surfaces.panel` is `baseUi.07`.
Each theme chooses its ten Base UI colors; Gray starts at dark gray rather than black.
Built-in surfaces and text reference this scale instead of adding separate neutral colors.
Existing custom themes with longer scales still load.
The earlier `glyphGrid` section name and color references remain supported for existing themes.
A role can also use an explicit color such as `#AABBCC`.
The theme's `markStep` chooses which Rainbow step appears on glyph cells.

Runebender writes simple canonical `public.markColor` values to UFO files (`1,0,0,1` for red, for example).
These values are compatibility tags, not display colors; each theme controls the visible Rainbow palette.
The editor still recognizes older values already saved in UFOs.

## Make and use a theme

```sh
runebender theme init --from gray --id my-theme --name "My Theme" --out my-theme.theme.toml
runebender theme validate my-theme.theme.toml
RUNEBENDER_THEME_PATH="$PWD/my-theme.theme.toml" RUNEBENDER_THEME=my-theme runebender
```

The `init` command creates a new file and never overwrites an existing one.
Use `--from light` or `--from dark` to start from those built-in themes.
`runebender theme list` and `runebender --json theme list` show discovered themes.
The native View → Theme menu includes installed themes, and Cycle Theme visits them after the built-ins.
Restart the editor after editing a theme file.

The native editor searches `$XDG_CONFIG_HOME/runebender/themes/`, or `~/.config/runebender/themes/` when `XDG_CONFIG_HOME` is unset.
It reads files ending in `.theme.toml` or `.theme.json` directly in that directory.
`RUNEBENDER_THEME_PATH` adds one file or a platform-separated list of files and directories.
These paths can point into a Git checkout or a dotfiles repository; a symlink in the config directory works too.
`RUNEBENDER_THEME` selects an installed theme by its `id`.
An unknown ID uses Gray and prints a diagnostic.
Invalid files are skipped with a path and error message; they do not prevent the editor from opening.
Installed IDs must be unique, use only ASCII letters, digits, `-` or `_`, and contain at most 64 characters.
Display names must contain 1–80 visible characters.

## Edit the file

Each theme file owns its Base UI stops, Rainbow hues and steps, surface colors, text colors, semantic roles, point and mark styles, and geometry.
Base UI and Rainbow hues use `oklch(lightness chroma hue)` color strings.
Lightness runs from 0 to 1, chroma describes color intensity from 0 upward with no fixed maximum, and hue runs around the color wheel from 0 to 360 degrees.
Rainbow steps use the same notation for signed offsets rather than complete colors.
For example, `bright = "oklch(0.13 -0.03 0)"` adds 0.13 lightness, subtracts 0.03 chroma, and leaves the hue unchanged.
The original component-table form remains supported for existing themes.
It does not depend on another theme file, so one file is enough to share a theme.
Sections and keys work like `Cargo.toml`, and `#` starts a comment.

```toml
formatVersion = 1
id = "my-theme"
name = "My Theme"

[baseUi]
"07" = "#AABBCC"

[surfaces]
panel = "baseUi.07"
```

This excerpt shows the syntax; copy a bundled theme for all required values.
The built-ins use `oklch(L C H)` values, with lightness `L` from 0 to 1 and hue `H` in degrees.
You can also use `#RRGGBB` or `#RRGGBBAA` for a Base UI stop or a direct surface, text, or role value.
References use `baseUi.00` or `rainbow.red.base` syntax.
The parser reports missing roles, bad references, unsupported format versions, and invalid colors by theme and key.
Unknown fields are rejected so misspelled settings do not silently disappear.

The shape fields in `geometry` are pixel measurements: `radius`, `radiusControl`, `stroke`, and `strokeEmphasis`.
`radius` rounds glyph tiles and popup surfaces; `radiusControl` rounds buttons and fields.
Set both to `0` for square geometry, or both to `4` for gently rounded geometry.
Circular mark swatches and icons retain their own shapes.
`markStyle` is `fill` or `border`; `pointStyle` is `fill` or `ring`.
`markOutline`, `markInk`, and `pointOutline` are optional colors; `pointHalo` is a boolean.
All seven named Rainbow marks must remain in `rainbow.marks` exactly once, because glyph mark names are saved font metadata.

Start a color change at the use site under `src/application/view/`, then follow its named color in `src/application/view/theme.rs` to the file's `surfaces`, `text`, or `roles` section.
`src/ui/theme.rs` is the toolkit-independent parser and resolver.
`src/application/platform/themes.rs` discovers native files.
Check Gray and Light captures at the same size after a built-in change.

## Sharing and external desktop themes

A theme repository can contain its `.theme.toml` file, a preview image, and a README; Runebender needs only the TOML file.
This is enough to share through GitHub or dotfiles and gives a future gallery a stable file to index.
Do not download and execute code to install a color theme.

An Omarchy theme repository can keep a Runebender `.theme.toml` beside its `colors.toml`, then expose that file through `RUNEBENDER_THEME_PATH` or a config-directory symlink.
The two formats are separate today; Runebender does not automatically read `colors.toml` or follow Omarchy theme switches.
A small generator or Omarchy template can translate its color values into Runebender's Base UI stops later, without changing Runebender's file format.
