let min = parseFloat($(".j-cnt-min").text());
const max = parseFloat($(".j-cnt-max").text());

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

        console.log(`currentTotal = ${currentTotal}`);
        console.log(`max = ${max}`);

        currentTotal = max - cart.count;
        if (cart.count >= min) {
          min = 1;
        }
        if (currentTotal > 0) {
          $(".j-countLabel").text(
            `укажите вес от ${min} до ${currentTotal} кг`
          );
        } else {
          $('button[value="cart/add"]').attr("disabled", "disabled");
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

const $selectionButtons = $(".j-countButtons");

if ($selectionButtons.length) {
  $("#product_price").prop("readonly", true);
  const buttonList = [...$selectionButtons.find("input")];
  buttonList.sort((a, b) => +a.value - +b.value);

  $(buttonList).first().attr("checked", "checked");

  $(document).on("change", ".j-countButtons input", function () {
    const count = +$(this).val();
    const currentValue = +$("#product_price").val();

    if ($(this).is(":checked")) {
      console.log(`count - ${count}`);
      console.log(`currentValue - ${currentValue}`);
      console.log(`разница - ${currentValue - count}`);
      $("#product_price").val((currentValue + count).toFixed(2));
    } else {
      $("#product_price").val((currentValue - count).toFixed(2));
    }
  });
}
