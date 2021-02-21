import "../styles/main.scss";

import "bootstrap/dist/css/bootstrap.css";
import "../styles/libs/libs2.css";
import "../styles/libs/libs.css";

import "./carousels";
import "@fancyapps/fancybox";

$(document).on("af_complete", function () {});

(function ($) {
  $(document).on("click touchend", ".j-checkbox-toggle", function () {
    const $container = $(this).closest(".form__wrapper");
    const $content = $container.find(".j-inputs-content");

    if ($(this).is(":checked")) {
      $content.hide();
      $(this).val(1);
    } else {
      $content.show();
      $(this).val(0);
    }
  });

  $(document).on("click touchend", "#appendTestReq", function () {
    $("#req_name").val("ООО РИК");
    $("#req_name_full").val("Общество с Ограниченной Ответственностью РИК");
    $("#req_phone").val("8005553535");
    $("#req_inn").val("123456789456123");
    $("#req_kpp").val("123456789456123");
    $("#req_ogrn").val("123456789456123");
    $("#req_okpo").val("123456789456123");
    $("#req_okved").val("12.34");

    $("#req_ur_street").val("Ленина");
    $("#req_ur_house").val("35");
    $("#req_ur_office").val("152");
    $("#req_ur_code").val("3465975");

    $("#req_fac_street").val("Гагарина");
    $("#req_fac_house").val("165");
    $("#req_fac_office").val("18");
    $("#req_fac_code").val("9768948");

    $("#req_mail_street").val("Большой пр В.О.");
    $("#req_mail_house").val("10");
    $("#req_mail_office").val("235");
    $("#req_mail_code").val("179354");

    $("#req_dost_street").val("Мурзинская");
    $("#req_dost_house").val("12");
    $("#req_dost_office").val("112");
    $("#req_dost_code").val("124689");

    $("#req_bank_name").val("Сбербанк");
    $("#req_bank_address").val("ул. Ленина, 16");
    $("#req_bank_rs").val("346579621654895747863224");
    $("#req_bank_bik").val("654987354618987");
    $("#req_bank_ks").val("135479887897897896545646");

    $("#req_dir_fio").val("Сергеев Олег Михайлович");
    $("#req_dir_email").val("dir@mail.ru");
    $("#req_dir_phone").val("9216859595");

    $("#req_buh_fio").val("Говорова Татьяна Олеговна");
    $("#req_buh_email").val("buh@mail.ru");
    $("#req_buh_phone").val("9116546565");
  });
});

(function ($) {
  $(document).on("click", ".factAdrCheck .check", function () {
    //e.preventDefault();

    if ($(this).is(":checked")) {
      $(".factAdr").hide();
    } else {
      $(".factAdr").show();
    }
  });

  $(document).on("click", ".corrAdrCheck .check", function () {
    //e.preventDefault();

    if ($(this).is(":checked")) {
      $(".corrAdr").hide();
    } else {
      $(".corrAdr").show();
    }
  });

  $(document).on("click", "#filters #prokat button", function (e) {
    e.preventDefault();

    var prokat = $(this).data("name");
    $("input[name=prokat]").val(prokat);
    $(".prokatV").html('<span class="clearProkat">' + prokat + " x</span>");
    $(".vib").show();

    filters();
  });

  $(document).on("click", "#filters #size button", function (e) {
    e.preventDefault();

    var size = $(this).data("name");
    $("input[name=size]").val(size);
    $(".sizeV").html('<span class="clearSize">' + size + " x</span>");
    $(".vib").show();

    filters();
  });

  $(document).on("click", "#filters #clear", function (e) {
    e.preventDefault();

    $("input[name=prokat]").val("");
    $("input[name=size]").val("");

    $(".prokatV").html("");
    $(".sizeV").html("");

    $(".vib").hide();

    filters();
  });

  $(document).on("click", ".clearProkat", function (e) {
    e.preventDefault();

    $("input[name=prokat]").val("");
    $(".prokatV").html("");
    if ($(".sizeV").html() === "") {
      $(".vib").hide();
    }

    filters();
  });

  $(document).on("click", ".clearSize", function (e) {
    e.preventDefault();

    $("input[name=size]").val("");
    $(".sizeV").html("");
    if ($(".prokatV").html() === "") {
      $(".vib").hide();
    }

    filters();
  });

  function filters() {
    if (typeof pdoPage == "undefined") return;

    var fields = {};
    $.each($("#filters").serializeArray(), function () {
      console.log($("#filters").serializeArray());
      // Если параметр не является массивом (чекбоксом), то все просто
      if (this.name.indexOf("[]") <= 0) {
        fields[this.name] = this.value;
      } else {
        // Для чекбоксов посложнее
        var name = this.name.replace("[]", "");
        if (typeof fields[name] == "undefined") {
          fields[name] = [];
        }
        fields[name].push(this.value);
      }
    });

    console.log(fields);

    // И отправляем этот массив на сервер.
    $.post(
      document.location.href,
      {
        action: "filter",
        fields: fields,
        // Параметр hash - обязательный (он содержит настройки pdoPage)
        hash: pdoPage.configs.page.hash,
      },
      function () {
        // Просим pdoPage загрузить новый список ресурсов
        var tmp = document.location.href.split("?");
        pdoPage.keys.page = 0;
        pdoPage.loadPage(tmp[0], pdoPage.configs.page);
      }
    );
  }
});
