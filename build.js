const esbuild = require("esbuild");
const fs = require("fs");
const path = require("path");

const sharedConfig = {
  entryPoints: ["./src/Index.bs.js"], // Input source file
  minify: true,
  bundle: true,
  loader: {
    ".js": "jsx",
  },
  external: ["react", "react-dom"], // External dependencies
  plugins: [],
  sourcemap: true,
};

const copyTypeDefinitions = () => {
  const typeDefSource = path.join(__dirname, "src/index.d.ts");
  const typeDefDest = path.join(__dirname, "dist/index.d.ts");

  if (fs.existsSync(typeDefSource)) {
    fs.copyFileSync(typeDefSource, typeDefDest);
    console.log("✓ Type definitions copied to dist");
  } else {
    console.warn(
      "⚠ Warning: Type definitions file not found at src/index.d.ts"
    );
  }
};

const build = async (options) => {
  try {
    console.log(`Building for format: ${options.format.toUpperCase()}`);
    await esbuild.build(options);
    console.log(`✓ Build successful: ${options.outfile}`);
  } catch (error) {
    console.error(
      `✗ Build failed for format: ${options.format.toUpperCase()}`,
      error
    );
    process.exit(1);
  }
};

const runBuilds = async () => {
  // Ensure the dist folder exists
  if (!fs.existsSync("dist")) {
    fs.mkdirSync("dist", { recursive: true });
  }

  // Build for ESM with desired .mjs output
  await build({
    ...sharedConfig,
    outfile: "dist/index.mjs", // Explicitly set output filename
    format: "esm",
  });

  // Build for CommonJS with desired .js output
  await build({
    ...sharedConfig,
    outfile: "dist/index.js", // Explicitly set output filename
    format: "cjs",
  });

  // Copy type definitions to dist
  copyTypeDefinitions();
};

runBuilds();
