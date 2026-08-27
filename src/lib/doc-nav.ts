/** The documentation groups, in the order the sidebar shows them.
 *
 * The sidebar is the only place a group name appears; a page title
 * comes from the page itself. */
export type DocLink = { slug: string; label?: string; href?: string };
export type DocGroup = { label: string; links: DocLink[] };

export const docGroups: DocGroup[] = [
  {
    label: "Start",
    links: [
      { slug: "index", label: "Overview", href: "/docs" },
      { slug: "install" },
      { slug: "first-steps" },
      { slug: "opening" },
      { slug: "concepts" },
      { slug: "interface" },
    ],
  },
  {
    label: "Editing",
    links: [
      { slug: "tools" },
      { slug: "glyphs" },
      { slug: "paths" },
      { slug: "components" },
      { slug: "masters" },
      { slug: "spacing" },
      { slug: "features" },
      { slug: "color" },
      { slug: "text" },
      { slug: "font-info" },
      { slug: "checking" },
    ],
  },
  {
    label: "Learn",
    links: [
      { slug: "tutorial-first-glyph", label: "Draw a Glyph" },
      { slug: "workflows" },
    ],
  },
  {
    label: "Reference",
    links: [
      { slug: "shortcuts" },
      { slug: "format" },
      { slug: "exporting" },
      { slug: "scripting" },
      { slug: "troubleshooting" },
      { slug: "development" },
      { slug: "faq" },
      { slug: "glossary" },
    ],
  },
];
