---
title: "Interface design principles"
lede: "Keep the glyph primary and the application state legible."
status: "Current design guidance"
stability: "Apply with judgment to the current interface"
order: 27.1
description: "Runebender's interface design principles and visual checks."
---

Runebender is a dense working tool for type design.
Controls should remain stable while values change, and decoration should never obscure the active glyph.
Other editors are references to evaluate, not feature lists to copy.

## Use named roles

Colors come from installed `.theme.toml` files and are resolved through `src/application/view/theme.rs`.
The [theme guide](/docs/themes.html) names the Base UI and Glyph Grid palettes.
Spacing, sizes, radii, strokes, and type come from `src/application/view/design.rs`.
Repeated controls belong in `src/application/view/recipes.rs`.
A new color needs a named role in every built-in theme.

## Keep the interface steady

- Align controls to shared sizes and keep sibling spacing in one place.
- Do not make panels jump or reorder under the pointer as content changes.
- Keep canvas marks thin and relevant to the active edit.
- Let chrome describe application state without covering the drawing.
- Use sentence case; commands are verbs and labels are nouns.
- Error text says what failed and what the user can do next.

## Check the actual result

Inspect Gray and Light at the same size after an interface change.
A headless capture shows the rendered widget tree but does not prove pointer, keyboard, IME, accessibility, or GPU behavior.
Run a native interaction check when the change affects those paths.
The repository's `AGENTS.md` and CI define the current code checks.
