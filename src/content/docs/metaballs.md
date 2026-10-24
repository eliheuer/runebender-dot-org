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
Choose the Metaball tool in the Shapes button of the toolbar. Click to place a center, and drag a center to move it.
The Metaballs section of the inspector has X, Y, Radius, and Threshold for the selected centers, and **Select all centers**.
Centers in a group blend together.

Use **Convert to cubic** or **Convert to hyperbezier** in the inspector to create ordinary outlines.
The Path menu has the same commands: **Metaballs to Cubic** and **Metaballs to Hyperbezier**.
**Font to Cubic (Current Master, Overview)** converts the current master of the whole font as one undoable batch.
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
