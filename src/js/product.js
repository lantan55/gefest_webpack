const min = +$(".j-cnt-min").text();
const max = +$(".j-cnt-max").text();

console.log("min - ", min);
console.log("max - ", max);

let currentTotal = +max;
const cart = {};

$("#product_price").val(min).attr({ min: min, max: max });

// $(document).on("mouseup keyup", "#product_price", function () {
//   // $(this).val(Math.min(max, Math.max(min, $(this).val())));
// });

$.post(
  "/gettotal",
  {
    cart: JSON.stringify({
      test: 1,
    }),
  },
  function (data) {
    console.log(JSON.parse(data));
    const cart_list = JSON.parse(data);
  }
).fail(function () {
  alert("Произошла ошибка. Обновите страницу");
});

miniShop2.Callbacks.add("Cart.add.before", "restrict_cart1", function () {
  console.log("currentTotal - ", currentTotal);
  const current = +$("#product_price").val();
  if ($("#product_price").val() < min) {
    miniShop2.Message.error("Количество не должно быть меньше минимального!");
    return false;
  } else if ($("#product_price").val() > currentTotal) {
    miniShop2.Message.error("Количество превышает максимальное значение!");
    return false;
  } else {
    return true;
  }
});
miniShop2.Callbacks.add(
  "Cart.add.response.success",
  "restrict_cart",
  function (response) {
    console.log(response);
    const count = response.data.total_count;
    currentTotal = max - count;
    console.log("max - ", max);
    console.log("count - ", count);
  }
);
