#!/usr/bin/env python3
"""Build public/llms-full.txt from the doc pages.

The docs are the source of truth. This turns their MDX into plain
text so the bundle cannot drift from the pages it claims to bundle.
Run it after editing anything under src/content/docs.
"""
import ast
import html
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parent.parent
DOCS = ROOT / "src/content/docs"
OUT = ROOT / "public/llms-full.txt"

HEAD = """# Runebender Documentation

A plain-text bundle of the Runebender documentation at
https://runebender.org/docs, generated from the same pages.

Runebender is a free, open-source font editor for UFO and designspace
sources, built on the Linebender ecosystem of Rust crates. A headless
core does the font work, and a GPUI front-end runs both in the browser
as WebAssembly and as a native application from the same code.

It is alpha software. Treat this as an orientation map, not a stable
API contract, and verify behaviour against the source.

Source: https://github.com/eliheuer/runebender-gpui
Shared core: https://github.com/eliheuer/runebender-core
License: Apache-2.0 or MIT
"""


def frontmatter(text):
    _, fm, body = text.split("---", 2)
    data = {}
    for line in fm.splitlines():
        if ": " in line:
            k, v = line.split(": ", 1)
            v = v.strip()
            if v.startswith('"'):
                v = ast.literal_eval(v)
            data[k.strip()] = v
    return data, body


def strip_jsx(body):
    out = []
    fenced = False
    for line in body.splitlines():
        s = line.strip()
        # Keep examples intact: JSX filtering must not remove JSON braces.
        if s.startswith("```"):
            fenced = not fenced
            out.append(line)
            continue
        if fenced:
            out.append(line)
            continue
        if s.startswith("import ") or s in ("<div>", "</div>"):
            continue
        # <DocSection title="X"> becomes a heading
        m = re.match(r'<DocSection title="([^"]+)"', s)
        if m:
            out.append(f"\n### {m.group(1)}\n")
            continue
        # table rows become list items
        m = re.match(r"<tr><th>(.*?)</th><td>(.*?)</td></tr>", s)
        if m:
            out.append(f"- {clean(m.group(1))}: {clean(m.group(2))}")
            continue
        m = re.match(r"<caption>(.*?)</caption>", s)
        if m:
            out.append(f"{clean(m.group(1))}:")
            continue
        # MiniIndex and CommandList items
        m = re.match(r'.*title: "([^"]+)", description: "([^"]+)"', s)
        if m:
            out.append(f"- {m.group(1)}: {m.group(2)}")
            continue
        m = re.match(r'^"(.+)",?$', s)
        if m:
            out.append(f"    {m.group(1)}")
            continue
        # component open/close lines carry no prose
        if re.match(r"^<[A-Z]", s) or s in ("]} />", "/>", "}"):
            continue
        if re.match(r"^</[A-Z]", s):
            continue
        if re.match(r"^</?(table|tbody|thead|caption|tr|th|td|section|div)\b", s):
            s = clean(s)
            if not s:
                continue
        cleaned = clean(s)
        if cleaned or (out and out[-1] != ""):
            out.append(cleaned)
    text = "\n".join(out)
    return re.sub(r"\n{3,}", "\n\n", text).strip()


def clean(s):
    s = re.sub(r"<[^>]+>", "", s)
    s = s.replace("`", "")
    return html.unescape(s).strip()


pages = []
for path in sorted(DOCS.glob("*.mdx")):
    data, body = frontmatter(path.read_text())
    pages.append((data["order"], path.stem, data, body))
pages.sort(key=lambda p: float(p[0]))

parts = [HEAD]
for _, slug, data, body in pages:
    title = data["title"].rstrip(".")
    parts.append(
        f"\n\n## {title}\n"
        f"https://runebender.org/docs/{slug}.html\n\n"
        f"{data['lede']}\n\n"
        f"{strip_jsx(body)}\n"
    )
OUT.write_text("".join(parts).rstrip() + "\n")
print(f"wrote {OUT.relative_to(ROOT)} ({len(OUT.read_text().splitlines())} lines)")
