# Font design brief

Copy this file to the root of a font repository as `DESIGN.md`. Keep it short:
it is the context an agent should read before inspecting a font or proposing a
change. Replace every bracketed value. Delete sections that do not apply.

## Project

- **Family and sources:** [Family name; designspace or primary UFO path]
- **Design purpose and intended sizes:** [text/display; languages; use]
- **Current task:** [one concrete outcome]
- **Owner of final decisions:** [name or role]

## Do not change without explicit approval

- [Approved glyphs, masters, or features]
- [Naming, encoding, components, or source layout]
- [Any compatibility or licensing constraint]

## Masters and interpolation

| Master index | Name | Source | Role |
| --- | --- | --- | --- |
| 0 | [Regular] | [sources/Family-Regular.ufo] | [reference / target] |
| 1 | [Bold] | [sources/Family-Bold.ufo] | [reference / target] |

- **Axes and ranges:** [for example `wght 400–700`]
- **Compatibility rule:** Preserve contour count/order/direction, start points,
  point types, and component structure across compatible masters.
- **Exception policy:** [who may authorize a structural redraw, and how it is checked]

## Drawing system

- **UPM and grid:** [for example `1000 UPM; whole units only except curve controls`]
- **Vertical metrics:** [baseline, x-height, cap height, ascender, descender]
- **Overshoot:** [which round or pointed forms overshoot and by how much]
- **Stroke logic:** [stems, contrast, joins, terminals, diagonals]
- **Counters and apertures:** [minimums or comparable approved forms]
- **Components and anchors:** [when to preserve, add, or decompose them]

## Spacing and kerning

- **Width and sidebearing approach:** [rules and references]
- **Recurring proof strings/pairs:** [for example `nn no on HHO OOO AV To`]
- **Kerning policy:** [groups, exceptions, scripts, and approval requirement]

## Approved references and marks

| Master | Glyphs | Meaning | May an agent edit them? |
| --- | --- | --- | --- |
| [Regular] | [H O n o] | [approved construction references] | No |
| [Bold] | [H O n o] | [approved weight references] | No |

- **Mark labels/colors:** [for example green = approved; orange = revision; red = replacement]
- Resolve a Unicode scalar through `glyph_inventory`; do not assume a glyph name.

## Agent workflow and acceptance

1. Read this file and the relevant Runebender documentation.
2. Confirm the project, master indices, target glyph records, and approved references.
3. Read geometry and inspect proofs before making a visual claim.
4. Create a named proposal or experiment branch; do not install, save, or overwrite files unless asked.
5. Proof the result at [sizes] and in [strings]. Report visual findings separately from metrics and kerning.
6. Before acceptance run: [commands/checks].

An accepted result must: [specific visual and technical criteria].

## Decisions and open questions

- [Date — decision, evidence, owner]
- [Unresolved question and the next proof or check needed]
