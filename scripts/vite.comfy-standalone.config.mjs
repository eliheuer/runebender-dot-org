import { createRequire } from "node:module";
import { fileURLToPath } from "node:url";

const require = createRequire(new URL("../../runebender-comfy/web/package.json", import.meta.url));
const { defineConfig } = require("vite");
const vue = require("@vitejs/plugin-vue");

const webRoot = fileURLToPath(new URL("../../runebender-comfy/web/", import.meta.url));
const outputDir = fileURLToPath(new URL("../public/cloud/editor/", import.meta.url));

export default defineConfig({
  root: webRoot,
  base: "./",
  plugins: [vue()],
  build: {
    outDir: outputDir,
    emptyOutDir: true,
  },
});
