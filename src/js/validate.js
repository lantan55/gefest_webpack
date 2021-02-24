import "jquery-validation";

// Validation

$.validator.addMethod("checkPhone", function (value) {
  return /\+\d{1}\(\d{3}\)\d{3}-\d{4}/g.test(value);
});

$.validator.addMethod("checkInn", function (value) {
  return /\d{10}/g.test(value);
});
$.validator.addMethod("checkKpp", function (value) {
  return /\d{9}/g.test(value);
});
$.validator.addMethod("checkOgrn", function (value) {
  return /\d{13}/g.test(value);
});
$.validator.addMethod("checkOkpo", function (value) {
  return /\d{8}/g.test(value);
});
$.validator.addMethod("checkOkved", function (value) {
  return /([\d]{1,3})+(\.[\d]{1,3}|){1,}/g.test(value);
});
$.validator.addMethod("checkCode", function (value) {
  return /\d{6}/g.test(value);
});
$.validator.addMethod("checkRs", function (value) {
  return /\d{20}/g.test(value);
});
$.validator.addMethod("checkBik", function (value) {
  return /\d{9}/g.test(value);
});

$.validator.messages.required = "Поле не должно быть пустым";
$.validator.messages.minlength =
  "Это поле должно содержать ни меньше 2 символов";
$.validator.messages.checkPhone = "Введите полный номер телефона";
$.validator.messages.checkInn = "Введите полный номер ИНН";
$.validator.messages.checkKpp = "Введите полный номер КПП";
$.validator.messages.checkOgrn = "Введите полный номер ОГРН";
$.validator.messages.checkOkved = "Введите правильный код ОКВЭД";
$.validator.messages.checkOkpo = "Введите правильный код ОКПО";
$.validator.messages.checkCode = "Введите правильный индекс";
$.validator.messages.checkRs = "Введите номер полностью";
$.validator.messages.checkBik = "Введите номер полностью";
$.validator.messages.email = "Введите верный email адрес";

$.validator.addClassRules({
  input__text: {
    required: true,
  },
  input__phone: {
    required: true,
    checkPhone: true,
  },
  input__code: {
    required: true,
    checkCode: true,
  },
  input__email: {
    email: true,
  },
});

$("form.validate").validate({
  submitHandler: function (form) {
    const $container = $(form);
    const $legal = $container.find(".form__wrapper .legal");
    const region = $legal.find(".region").val();
    const city = $legal.find(".city").val();
    const street = $legal.find(".street").val();
    const house = $legal.find(".house").val();
    const office = $legal.find(".office").val();
    const code = $legal.find(".code").val();

    function insertAddressData($cont) {
      const $check = $cont.find(".j-checkbox-toggle:checked");
      if ($check.length) {
        $cont.find(".region").val(region);
        $cont.find(".city").val(city);
        $cont.find(".street").val(street);
        $cont.find(".house").val(house);
        $cont.find(".office").val(office);
        $cont.find(".code").val(code);
      }
    }

    insertAddressData($container.find(".fact"));
    insertAddressData($container.find(".mail"));
    form.submit();
  },
  rules: {
    "Реквизиты[ИНН]": {
      required: true,
      checkInn: true,
    },
    "Реквизиты[КПП]": {
      required: true,
      checkKpp: true,
    },
    "Реквизиты[ОГРН]": {
      required: true,
      checkOgrn: true,
    },
    "Реквизиты[ОКВЭД]": {
      required: true,
      checkOkved: true,
    },
    "Реквизиты[ОКПО]": {
      required: true,
      checkOkpo: true,
    },
    "Банковские_реквизиты[расчетный_счет]": {
      required: true,
      checkRs: true,
    },
    "Банковские_реквизиты[БИК]": {
      required: true,
      checkOkved: true,
    },
    "Банковские_реквизиты[кор_счет]": {
      required: true,
      checkRs: true,
    },
  },
});
