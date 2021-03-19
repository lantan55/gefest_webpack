import Cookies from "js-cookie";

const currentProduct = $(".product.ms2_form input[name='id']").val() || null;
const $selectionButtons = $(".j-countButtons");
let min = parseFloat($(".j-cnt-min").text());
let max = parseFloat($(".j-cnt-max").text());
let currentTotal = +max;
let cart = {};
let btnAddedList = [];

const $container = $(".add-to-cart__status");

$("#product_price").val(min).attr({ min: min, max: max });

function getCart(btnList) {
  const productId = $('#msProduct input[name="id"]').val();
  if (productId) {
    const postData = {
      id: productId,
      key: cart.key,
      btn_list: btnList || [],
    };

    $.post(
      "/gettotal",
      {
        cart: JSON.stringify(postData),
      },
      function (data) {
        const currentProduct = $(".ms2_form input[name='id']").val();

        cart = JSON.parse(data);
        cart.count = cart.count || 0;

        if ($container) {
          if (cart.id === currentProduct) $container.addClass("active");
        }

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

  if ($container) {
    if (current > max) {
      miniShop2.Message.error(
        "Вы пытаетесь добавить больше максимального веса"
      );
      return false;
    } else {
      $container.addClass("active");
    }
  }

  const btnAddedList = [];
  if ($selectionButtons.length) {
    const $buttons = $selectionButtons.find("input:checked");

    $buttons.each(function () {
      btnAddedList.push({
        id: $(this).attr("id"),
        value: $(this).val(),
      });
    });
    Cookies.set("btn_list", JSON.stringify(btnAddedList));
  }
  // getCart(btnAddedList);
});

miniShop2.Callbacks.add(
  "Cart.add.response.success",
  "restrict_cart",
  function (response) {
    const count = response.data.total_count;
    currentTotal = max - count;
    Cookies.remove("btn_list");
  }
);

if ($selectionButtons.length) {
  $("#product_price").attr("readonly", "readonly");
  let buttonList = [...$selectionButtons.find("input")];
  buttonList.sort((a, b) => +a.value - +b.value);

  $(buttonList).first().attr("checked", "checked");
  $(document).on("change", ".j-countButtons input", function () {
    const count = +$(this).val();
    const currentValue = +$("#product_price").val();

    if ($(this).is(":checked")) {
      $("#product_price").val((currentValue + count).toFixed(2));
    } else {
      $("#product_price").val((currentValue - count).toFixed(2));
    }
  });
}
getCart();
