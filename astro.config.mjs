import { defineConfig } from "astro/config";
import mdx from "@astrojs/mdx";
import sitemap from "@astrojs/sitemap";

export default defineConfig({
  site: "https://runebender.org",
  trailingSlash: "never",
  build: {
    format: "preserve",
  },
  integrations: [mdx(), sitemap()],
});
