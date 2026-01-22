const path = require("path");

module.exports = {
  entry: "./src/Index.bs.js",
  output: {
    path: path.resolve(__dirname, "dist"),
    filename: "bundle.js",
    libraryTarget: "umd",
    library: "ReactHyperJs",
    globalObject: "this",
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
          options: {
            presets: ["@babel/preset-env"],
          },
        },
      },
    ],
  },
  externals: {
    react: {
      commonjs: "react",
      commonjs2: "react",
      amd: "react",
      root: "React",
    },
    "react-dom": {
      commonjs: "react-dom",
      commonjs2: "react-dom",
      amd: "react-dom",
      root: "ReactDOM",
    },
    "react/jsx-runtime": {
      commonjs: "react/jsx-runtime",
      commonjs2: "react/jsx-runtime",
      amd: "react/jsx-runtime",
    },
  },
  mode: "production",
};
