const min = $(".j-cnt-min").text();
const max = $(".j-cnt-max").text();

// console.log(min);
// console.log(max);
// $("#product_price").val(min).attr({ min: min, max: max });

// $(document).on("mouseup keyup", "#product_price", function () {
//   // $(this).val(Math.min(max, Math.max(min, $(this).val())));
// });

miniShop2.Callbacks.add(
  "Cart.add.response.success",
  "restrict_cart",
  function (response) {
    const key = response.data.key;

    // $(".j-cnt-max").text(max - count);
    // $("#product_price").attr({ max: $(".j-cnt-max").text() });
    // $(document).on("mouseup keyup", "#product_price", function () {
    //   $(this)
    //     .val
    //     // Math.min($(".j-cnt-max").text(), Math.max(min, $(this).val()))
    //     ();
    // });

    $.post(
      "/gettotal",
      {
        total_count: JSON.stringify({
          key: key,
        }),
      },
      function (data) {
        console.log(data);
      }
    ).fail(function () {
      alert("Произошла ошибка. Обновите страницу");
    });
  }
);
