// favorites
function getFavoritesItems() {
  const currentFavorites = JSON.parse(localStorage.getItem("products")) || {
    data: [],
  };
  if (currentFavorites.data) {
    $(".j-item").each(function () {
      const id = $(this).find("input[name='id']").val();
      if (currentFavorites.data.includes(id)) {
        $(this).find(".toFav").addClass("active");
      } else {
        $(this).find(".toFav").removeClass("active");
      }
    });
  }
  $("#favCount").text(currentFavorites.data.length);
}

getFavoritesItems();

$(document).on("click", ".toFav", function (e) {
  e.preventDefault();
  console.log("toFav");
  const $container = $(this).closest("form");
  const id = $container.find("input[name='id']").val();
  const arr = JSON.parse(localStorage.getItem("products")) || { data: [] };

  console.log($container);
  console.log(id);
  console.log(arr);
  console.log($(this));

  if (arr.data.includes(id)) {
    $(this).removeClass("active");
    arr.data = arr.data.filter((item) => item !== id);
    localStorage.setItem("products", JSON.stringify(arr));
  } else {
    arr.data.push(id);
    localStorage.setItem("products", JSON.stringify(arr));
    $(this).addClass("active");
  }
  $("#favCount").text(arr.data.length);
  getFavoritesItems();
});

const $favContainer = $("#favList");
if ($favContainer.length) {
  const favorites = JSON.parse(localStorage.getItem("products"));
  if (favorites) {
    $.post(
      "/favorites",
      {
        fav_list: JSON.stringify(favorites.data),
      },
      function (data) {
        $favContainer.html(data);
        getFavoritesItems();
      }
    ).fail(function () {
      alert("Произошла ошибка. Обновите страницу");
    });
  }
  $(document).on("click", ".toFav", function (e) {
    e.preventDefault();
    const newFav = JSON.parse(localStorage.getItem("products"));
    $.post(
      "/favorites",
      {
        fav_list: JSON.stringify(newFav.data),
      },
      function (data) {
        $favContainer.html(data);
        getFavoritesItems();
      }
    ).fail(function () {
      alert("Произошла ошибка. Обновите страницу");
    });
  });
}
