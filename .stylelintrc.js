module.exports = {
  extends: [
    "stylelint-config-airbnb",
    "stylelint-config-rational-order",
    "stylelint-config-prettier",
  ],
  plugins: ["stylelint-order", "stylelint-scss"],
  rules: {
    // Дополнительные правила
    "max-nesting-depth": [3, { ignore: ["pseudo-classes"] }],
  },
};
