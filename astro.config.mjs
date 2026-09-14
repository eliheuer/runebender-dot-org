import { defineConfig } from "astro/config";
import mdx from "@astrojs/mdx";
import sitemap from "@astrojs/sitemap";

const site = "https://runebender.org";

const htmlSitemapUrl = (item) => {
  const url = new URL(item.url);
  if (url.pathname !== "/") url.pathname = url.pathname.replace(/\/+$/, "");
  if (url.pathname === "/") {
    url.pathname = "/";
  } else if (url.pathname === "/wasm-editor") {
    url.pathname = "/wasm-editor/";
  } else if (url.pathname === "/docs" || url.pathname === "/cloud" || url.pathname === "/editor") {
    url.pathname = `${url.pathname}/index.html`;
  } else if (url.pathname.startsWith("/docs/") && !url.pathname.endsWith(".html")) {
    url.pathname = `${url.pathname}.html`;
  }
  return { ...item, url: url.href };
};

export default defineConfig({
  site,
  trailingSlash: "ignore",
  build: {
    format: "preserve",
  },
  integrations: [
    mdx(),
    sitemap({
      filter: (page) => !new URL(page).pathname.startsWith("/editor"),
      customPages: [`${site}/cloud/editor/index.html`],
      serialize: htmlSitemapUrl,
    }),
  ],
});
