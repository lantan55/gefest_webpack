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
      name: "vendor",
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
    // new webpack.ProvidePlugin({
    //   $: "jquery",
    //   jQuery: "jquery",
    //   "window.jQuery": "jquery",
    // }),
  ],
};

// import webpack from "webpack";
// import path from "path";
// import ExtractTextPlugin from "extract-text-webpack-plugin";
// import HtmlWebpackPlugin from "html-webpack-plugin";
// import postcssNext from "postcss-cssnext";
// import postcssImport from "postcss-import";
// import postcssExtend from "postcss-extend";
// import postcssReporter from "postcss-reporter";
// import StyleLintPlugin from "stylelint-webpack-plugin";
// import BrowserSyncPlugin from "browser-sync-webpack-plugin";

// const extractStyles = new ExtractTextPlugin({ filename: "css/[name].css" });

// const postcssProcessors = [
//   postcssImport,
//   postcssExtend,
//   postcssNext,
//   postcssReporter({ clearReportedMessages: true }),
// ];

// const scssProcessors = [postcssReporter({ clearReportedMessages: true })];

// module.exports = (env) => {
//   const stylesType = process.env.STYLES; // postcss or scss
//   const stylesExtension = stylesType === "scss" ? ".scss" : ".css";

//   return {
//     context: path.resolve(__dirname, "src"),

//     entry: {
//       main: "./js/index.js",
//     },

//     output: {
//       path: path.resolve(__dirname, "../dist"),
//       filename: "assets/js/[name].js",
//     },

//     watch: env.dev,

//     devtool: "cheap-module-source-map",
//     module: {
//       rules: [
//         {
//           test: /\.js$/,
//           include: path.resolve(__dirname, "src/js"),
//           use: [
//             {
//               loader: "babel-loader",
//               options: {
//                 cacheDirectory: true,
//                 plugins: ["transform-runtime"],
//               },
//             },
//             {
//               loader: "eslint-loader",
//               options: {
//                 cache: true,
//                 emitWarning: true,
//                 configFile: ".eslintrc",
//               },
//             },
//           ],
//         },
//         {
//           test: /\.css$/,
//           use: extractStyles.extract({
//             use: [
//               {
//                 loader: "css-loader",
//                 options: {
//                   sourceMap: true,
//                 },
//               },
//               {
//                 loader: "postcss-loader",
//                 options: {
//                   sourceMap: true,
//                   plugins: postcssProcessors,
//                 },
//               },
//             ],
//             publicPath: "../",
//           }),
//         },
//         {
//           test: /\.scss$/,
//           use: extractStyles.extract({
//             use: [
//               {
//                 loader: "css-loader",
//                 options: {
//                   sourceMap: true,
//                 },
//               },
//               {
//                 loader: "postcss-loader",
//                 options: {
//                   sourceMap: true,
//                   plugins: scssProcessors,
//                 },
//               },
//               {
//                 loader: "sass-loader",
//                 options: {
//                   sourceMap: true,
//                 },
//               },
//             ],
//             publicPath: "../",
//           }),
//         },
//         {
//           test: /.*\.(gif|png|jpe?g|svg)$/i,
//           use: [
//             {
//               loader: "file-loader",
//               options: {
//                 name: "assets/[name].[ext]",
//               },
//             },
//           ],
//         },
//         {
//           test: /\.(woff2?|ttf|eot)(\?v=\d+\.\d+\.\d+)?$/,
//           use: [
//             {
//               loader: "file-loader",
//               options: {
//                 name: "assets/[name].[ext]",
//               },
//             },
//           ],
//         },
//       ],
//     },

//     plugins: [
//       new webpack.optimize.CommonsChunkPlugin({
//         name: "common",
//       }),
//       extractStyles,
//     ],
//   };
// };
