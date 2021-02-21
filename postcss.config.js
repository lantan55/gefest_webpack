module.exports = ({ env }) => {
  return {
    plugins: {
      cssnano: env === "development" ? false : { preset: "default" },
      autoprefixer: {},
      "postcss-sort-media-queries": {
        sort: "mobile-first",
      },
    },
  };
};
