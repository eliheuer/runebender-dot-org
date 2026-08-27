/** The documentation groups, in the order the sidebar shows them.
 *
 * One list, used by the sidebar and by the page header: the section
 * label above a page title is the group that page sits in, so the two
 * can never disagree. */
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
    label: "How-To",
    links: [{ slug: "workflows" }],
  },
  {
    label: "Reference",
    links: [
      { slug: "shortcuts" },
      { slug: "format" },
      { slug: "exporting" },
      { slug: "troubleshooting" },
      { slug: "development" },
      { slug: "glossary" },
    ],
  },
];

/** The group a page belongs to, for the label above its title. */
export function groupFor(slug: string | undefined): string | undefined {
  if (!slug) return undefined;
  return docGroups.find((g) => g.links.some((l) => l.slug === slug))?.label;
}
