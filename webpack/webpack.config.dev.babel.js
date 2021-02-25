const webpack = require("webpack");
const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const WebpackBuildNotifierPlugin = require("webpack-build-notifier");
const AssetsManifest = require("webpack-assets-manifest");
const { CleanWebpackPlugin } = require("clean-webpack-plugin");

const env = process.env.NODE_ENV;

module.exports = {
  context: path.resolve(__dirname, "../src"),
  devtool: false,
  mode: env,
  entry: "./js/index.js",
  output: {
    publicPath: "/",
    path: path.resolve(__dirname, "../dist"),
    filename:
      env === "development"
        ? "assets/js/[name].[contenthash].js"
        : "assets/js/[name].[contenthash].min.js",
    chunkFilename:
      env === "development"
        ? "assets/js/[name].[contenthash].js"
        : "assets/js/[name].[contenthash].min.js",
  },
  optimization: {
    splitChunks: {
      chunks: "all",
      name: "common",
    },
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
        },
      },
      {
        test: /\.css$/,
        use: [MiniCssExtractPlugin.loader, "css-loader", "postcss-loader"],
      },
      {
        test: /\.s[ac]ss$/i,
        use: [
          MiniCssExtractPlugin.loader,
          "css-loader",
          "postcss-loader",
          "sass-loader",
        ],
      },
      {
        test: /\.(gif|png|jpe?g|svg)$/i,
        use: [
          {
            loader: "url-loader",
            options: {
              name: "assets/[path][name].[ext]",
              limit: 8192,
              esModule: false,
            },
          },
          "img-loader",
        ],
      },
      {
        test: /\.woff(2)?(\?[a-z0-9#=&.]+)?$/,
        use: [
          {
            loader: "url-loader",
            options: {
              name: "[name].[ext]",
              outputPath: "assets/fonts/",
              limit: 10000,
              mimetype: "application/font-woff",
            },
          },
        ],
      },
      {
        test: /\.(ttf|eot)(\?v=\d+\.\d+\.\d+)?$/,
        use: [
          {
            loader: "file-loader",
            options: {
              name: "[name].[ext]",
              outputPath: "assets/fonts/",
            },
          },
        ],
      },
    ],
  },
  plugins: [
    new CleanWebpackPlugin({
      cleanOnceBeforeBuildPatterns: [path.join(__dirname, "../dist/**/*")],
    }),
    new WebpackBuildNotifierPlugin(),
    new AssetsManifest({
      output: "assets/manifest.json",
      publicPath: true,
    }),
    new MiniCssExtractPlugin({
      filename:
        env === "development"
          ? "assets/css/[name].[contenthash].css"
          : "assets/css/[name].[contenthash].min.css",
    }),
    new webpack.ProvidePlugin({
      $: "jquery",
      jQuery: "jquery",
      "window.jQuery": "jquery",
    }),
  ],
};
