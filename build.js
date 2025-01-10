const esbuild = require("esbuild");

const sharedConfig = {
  entryPoints: ["./src/Index.bs.js"], // Input source file
  minify: true,
  bundle: true,
  loader: {
    ".js": "jsx",
  },
  external: ["react", "react-dom"], // External dependencies
  plugins: [],
};

const build = async (options) => {
  try {
    console.log(`Building for format: ${options.format.toUpperCase()}`);
    await esbuild.build(options);
    console.log(`Build successful: ${options.outfile}`);
  } catch (error) {
    console.error(
      `Build failed for format: ${options.format.toUpperCase()}`,
      error
    );
    process.exit(1);
  }
};

const runBuilds = async () => {
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
};

runBuilds();
