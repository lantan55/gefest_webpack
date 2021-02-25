import Inputmask from "inputmask";

Inputmask({ mask: "+7(999)999-9999", autoclear: false }).mask(".mask-phone");
Inputmask({ mask: "9999999999", autoclear: false }).mask(".mask-inn");
Inputmask({ mask: "9999999999999", autoclear: false }).mask(".mask-ogrn");
Inputmask({ mask: "99999999", autoclear: false }).mask(".mask-okpo");
Inputmask({ mask: "99999999999999999999", autoclear: false }).mask(".mask-rs");
Inputmask({ mask: "999999999", autoclear: false }).mask(".mask-bik");
Inputmask({ mask: "99999999999999999999", autoclear: false }).mask(".mask-ks");
Inputmask({ mask: "99", autoclear: false }).mask(".mask-tax");
Inputmask({ mask: "999999", autoclear: false }).mask(".mask-code");
