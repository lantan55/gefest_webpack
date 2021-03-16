const currentProduct = $(".product.ms2_form input[name='id']").val() || null;

let min = parseFloat($(".j-cnt-min").text());
const max = parseFloat($(".j-cnt-max").text());

let currentTotal = +max;
let cart = {};
const btnAddedList = [];
const $selectionButtons = $(".j-countButtons");

$("#product_price").val(min).attr({ min: min, max: max });

function getCart() {
  const productId = $('#msProduct input[name="id"]').val();
  if (productId) {
    $.post(
      "/gettotal",
      {
        cart: JSON.stringify({
          id: productId,
          btn_list: btnAddedList,
          key: cart.key,
        }),
      },
      function (data) {
        const currentProduct = $(".ms2_form input[name='id']").val();
        const $container = $(".add-to-cart__status");
        cart = JSON.parse(data);
        cart.count = cart.count || 0;

        cart.id === currentProduct
          ? $container.addClass("active")
          : $container.removeClass("active");

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
      }
    ).fail(function () {
      alert("Произошла ошибка. Обновите страницу");
    });
  }
}

miniShop2.Callbacks.add("Cart.add.before", "restrict_cart1", function () {
  const current = +$("#product_price").val();

  // if (cart.id === currentProduct) {
  //   console.log("уже в корзине");
  // }
  console.log(`cart - ${cart}`);

  console.log(`current - ${current}`);
  console.log(`min - ${min}`);
  console.log(`max - ${max}`);
  if (current > max) {
    miniShop2.Message.error("Вы пытаетесь добавить больше максимального веса");
    return false;
  }
});

miniShop2.Callbacks.add(
  "Cart.add.response.success",
  "restrict_cart",
  function (response) {
    const count = response.data.total_count;
    currentTotal = max - count;

    if ($selectionButtons.length) {
      const $buttons = $selectionButtons.find("input:checked");
      $buttons.each(function () {
        $(this).val;
        btnAddedList.push({
          id: $(this).attr("id"),
          value: $(this).val(),
        });
      });
    }
    getCart();
  }
);

if ($selectionButtons.length) {
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
getCart();
