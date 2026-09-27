---
title: "Metaballs"
lede: "Editable source shapes that blend before explicit contour conversion."
status: "Experimental"
stability: "Check the current editor for UI details"
order: 12.5
description: "Using and converting Runebender metaballs."
---

Metaballs remain editable source objects until explicit conversion.
Previewing or saving them does not add ordinary contour points.
Choose the paired-circle tool to place and move centers; use the inspector for position, Radius, Strength, and Threshold.
Centers in a group blend together, while **Start a new group** prepares an independent group.

Use **Groups to cubic** or **Glyph to cubic** in the inspector or Path menu to create ordinary outlines.
The overview can convert a font's current source as one undoable batch.
Convert before using an external compiler that does not understand Runebender's metaball metadata.

For a separate output UFO, run:

```sh
runebender collapse-metaballs Source.ufo --out Cubic.ufo
```

The destination must not exist, and the input is not overwritten.
`--resolution` controls field sampling and `--accuracy` controls curve fitting.
Conversion prepares the result before publishing it and reports a failure rather than replacing an unresolved shape.

Metaball metadata uses the versioned `com.runebender.metaballs` glyph-lib key.
The outline engine locates the field boundary, extrema, and curvature features, then uses [img2bez](https://github.com/eliheuer/img2bez) for constrained cubic fitting.
This preserves type-design structure such as extrema and on-axis handles in the converted contour.
