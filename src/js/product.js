let min = +$(".j-cnt-min").text();
const max = +$(".j-cnt-max").text();

let currentTotal = +max;
let cart = {};

$("#product_price").val(min).attr({ min: min, max: max });

function getCart() {
  const productId = $('#msProduct input[name="id"]').val();
  if (productId) {
    $.post(
      "/gettotal",
      {
        cart: JSON.stringify({
          id: productId,
        }),
      },
      function (data) {
        cart = JSON.parse(data);
        cart.count = cart.count || 0;

        currentTotal = max - cart.count;
        if (cart.count >= min) {
          min = 1;
        }
        if (currentTotal > 0) {
          $(".j-countLabel").text(
            `укажите вес от ${min} до ${currentTotal} кг`
          );
        } else {
          $(".j-countLabel").text(`Вы добавили максимальный вес`);
        }

        $("#product_price").val(min).attr({ min: min, max: currentTotal });

        console.log(`min - ${min}`);
        console.log(`max - ${currentTotal}`);
      }
    ).fail(function () {
      alert("Произошла ошибка. Обновите страницу");
    });
  }
}

getCart();

miniShop2.Callbacks.add("Cart.add.before", "restrict_cart1", function () {
  const current = +$("#product_price").val();

  if (current < min) {
    miniShop2.Message.error("Количество не должно быть меньше минимального!");
    return false;
  } else if (current > currentTotal) {
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
    const count = response.data.total_count;
    currentTotal = max - count;

    getCart();
  }
);
