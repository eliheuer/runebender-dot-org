# Font Editor Website Research

Date: 2026-05-14

## References

- Glyphs home: https://glyphsapp.com/
- Glyphs Learn: https://glyphsapp.com/learn
- Glyphs Handbook: https://handbook.glyphsapp.com/
- RoboFont home: https://robofont.com/
- RoboFont documentation: https://robofont.com/documentation/
- RoboFont scripting environment: https://robofont.com/documentation/topics/scripting-environment
- RoboFont getting started: https://robofont.com/documentation/how-tos/getting-started-in-robofont/
- FontForge: https://fontforge.org/en-US/
- Fontra: https://fontra.xyz/
- Current Runebender site: https://runebender.app/
- Original Runebender repository: https://github.com/linebender/runebender
- Runebender Xilem repository: https://github.com/eliheuer/runebender-xilem

## Glyphs site notes

Glyphs has a commercial product hierarchy but makes education and ecosystem feel equally important.

- Product split: Glyphs 3, Glyphs Mini, related tools.
- Primary calls to action: find out more, download app, compare features.
- Feature framing: Create, Produce, Extend.
- Learn surface: tutorials for different levels and topics.
- Documentation surface: a separate handbook with chapter-level structure.
- Community surface: forum, resources, plug-ins, scripts, professionals, news, events.
- Strong idea for Runebender: docs and community should be first-class navigation, not footer links.

Glyphs Handbook chapter model:

- Introduction
- Create
- Settings
- Edit View
- Palette
- Font View
- Font Info
- Import & Export
- Spacing & Kerning

## RoboFont site notes

RoboFont is a better model for a tool aimed at people who script, extend, and understand font sources.

- Home page gives product status, download/buy, docs, technical specs, extensions, education.
- Documentation is divided into Topics, Tutorials, How-Tos, Reference, Extensions, Mechanic, Extension Store, Education, Discord.
- RoboFont explicitly maps docs by intent: tutorials are learning-oriented, how-tos are problem-oriented practical steps, topics are understanding-oriented, and reference is information-oriented lookup.
- Scripting is core positioning, not an advanced appendix.
- Getting Started covers new font, drawing, spacing, features, extensions/scripts, exporting, troubleshooting.
- Technical specs are direct: macOS requirement, UFO3 native format, Python version.

Strong idea for Runebender:

- Treat the site as a manual and technical reference first.
- Keep build instructions and source workflow explicit.
- Use raw tables for shortcuts, commands, supported formats, and status.
- Add architecture notes and format notes early, because the audience is likely technical.
- For alpha software, keep docs at map-level unless behavior is stable. Prefer “what area exists” and “where to look” over long promises.

## Runebender positioning

Runebender should not look like a finished paid Mac product. It should look like:

- an experimental font editor,
- a documentation hub,
- a source-first open project,
- a design-engineering artifact,
- a place where font designers and tool builders can understand the system.

## Proposed information architecture

- Home: title, real editor screenshot, build/source links.
- Docs map: topics, tutorials, how-tos, reference.
- Manual: install, first run, open UFO, save, draw, trace, proof.
- Reference: commands, shortcuts, file formats, settings, known limitations.
- Formats: UFO, GLIF, hyperbezier extension, export behavior.
- Automation: current and future scripting/tooling surfaces.
- Development: architecture, Xilem model, modules, contribution notes.
- Research: why this project exists relative to Glyphs/RoboFont/Fontra/FontForge.
- Community: GitHub, Zulip, issues, roadmap.

## Visual direction

The requested direction is not polished SaaS. It should feel like web brutalist high-art design engineering:

- raw HTML/CSS feeling,
- gray backgrounds and dark gray text,
- hard borders,
- oversized uppercase type,
- tables and captions,
- real screenshots,
- dense indexes,
- no generic cards,
- no gradients,
- no fake UI mockups,
- no warm editorial palette.
