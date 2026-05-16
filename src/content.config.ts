import { defineCollection, z } from "astro:content";
import { glob } from "astro/loaders";

const docs = defineCollection({
  loader: glob({ pattern: "**/*.mdx", base: "./src/content/docs" }),
  schema: z.object({
    title: z.string(),
    navLabel: z.string().optional(),
    eyebrow: z.string(),
    lede: z.string(),
    status: z.string(),
    audience: z.string(),
    source: z.string(),
    stability: z.string(),
    order: z.number(),
    description: z.string().optional(),
  }),
});

export const collections = { docs };
