[[!UpdateProfile?
    &postHooks=`hookProfileUpdateFiles, hookProfileUpdateEmail`
    &excludeExtended=`files`    
]]
<div class="col-12">
        <p class="sd">
            {if $.get.username}
                <span class="success">
                    Спасибо за активацию аккаунта. Теперь вам необходимо заполнить реквизиты
                </span>
                <br/>
            {/if}
            Ваши реквизиты необходимы для заключения договора поставки, прохождения таможенных процедур, включая возврат
            денежных средств
        </p>
        <form action="[[~[[*id]]]]" method="post" class="form form-horizontal validate" enctype="multipart/form-data">
            <input type="hidden" name="email" value="[[!+email]]" />
            <input type="hidden" name="fullname" value="{$_modx->user.fullname}" />
            <input type="hidden" name="id" value="[[!+modx.user.id]]" />
            [[!+error.message:notempty=`
                <div class="my-2 form__error">
                    Ошибка! Не заполнены обязательные поля
                </div>
            `]]
            <div class="form-row">
                <div class="form-group col-md-6">
                    <div class="form__block">
                        <h2>1. Реквизиты компании</h2>
                        <div class="form-row">
                            <div class="col-12">
                                <h4>Краткое наименование*</h4>
                            </div>
                            <div class="col-4">
                                <div class="form-group position-relative">
                                    <select class="custom-select" id="req_form_sobst" name="Реквизиты[форма_собственности]" value="">
                                        <option value="ООО">ООО</option>
                                        <option value="АО">АО</option>
                                    </select>
                                    <label for="">Форма собственности</label>
                                </div>
                            </div>
                            <div class="col-8">
                                <div class="form-group position-relative">
                                    <input
                                            type="text"
                                            class="form-control input__text"
                                            id="req_name"
                                            placeholder="Введите название компании *"
                                            name="Реквизиты[название]"
                                            value=""
                                    />
                                    <label>Название компании</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-row mt-2">
                            <div class="col-12">
                                <h4>Полное наименование*</h4>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <input type="text"
                                           class="form-control input__text "
                                           id="req_name_full"
                                           placeholder="Введите полное наименование компании"
                                           name="Реквизиты[полное_наименование]"
                                           value=""
                                    />
                                </div>
                            </div>
                        </div>
                        <div class="form-row mt-2">
                            <div class="col-12">
                                <h4>Телефон*</h4>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <input type="text"
                                        id="req_phone"
                                        class="form-control mask-phone input__phone"
                                        placeholder="Номер телефона"
                                        data-rule-required="true"
                                        data-rule-minlength="10"
                                        data-msg="Введите номер телефона"
                                        name="Реквизиты[телефон]"
                                        value=""
                                    />
                                </div>
                            </div>
                        </div>
                        <div class="form-row mt-2">
                            <div class="col-12">
                                <h4>ИНН*</h4>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <input type="text"
                                           class="form-control mask-inn"
                                           id="req_inn" placeholder="Введите номер ИНН"
                                           name="Реквизиты[ИНН]"
                                           value=""
                                    />
                                    <label for="">Идентификационный номер налогоплательщика</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-row mt-2">
                            <div class="col-12">
                                <h4>КПП*</h4>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <input type="text"
                                           class="form-control mask-kpp"
                                           id="req_kpp" placeholder="Введите номер КПП"
                                           name="Реквизиты[КПП]"
                                           value=""
                                    />
                                </div>
                            </div>
                        </div>
                        <div class="form-row mt-2">
                            <div class="col-12">
                                <h4>ОГРН*</h4>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <input type="text"
                                           class="form-control mask-ogrn"
                                           id="req_ogrn" placeholder="Введите номер ОГРН"
                                           name="Реквизиты[ОГРН]"
                                           value=""
                                    />
                                    <label for="">Государственный регистрационный номер записи о создании юр. лица</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-row mt-2">
                            <div class="col-12">
                                <h4>ОКПО*</h4>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <input type="text"
                                           class="form-control mask-okpo"
                                           id="req_okpo" placeholder="Введите номер ОКПО"
                                           name="Реквизиты[ОКПО]"
                                           value=""
                                    />
                                    <label for="">Общероссийский классификатор предприятий и организаций</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-row mt-2">
                            <div class="col-12">
                                <h4>ОКВЭД*</h4>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <input type="text"
                                        id="req_okved"
                                        class="form-control"
                                        placeholder="Введите код ОКВЭД"
                                        name="Реквизиты[ОКВЭД]"
                                        value=""
                                    />
                                    <label for="">Общероссийский классификатор видов экономической деятельности</label>
                                </div>
                            </div>
                        </div>
                        <!-- <div class="form-row mt-2">
                            <div class="col-12">
                                <h4>Применяемая система налогообложения *</h4>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <select class="custom-select"  name="Реквизиты[налоговая_система]" value="">
                                        <option value="ОСН">ОСН</option>
                                        <option value="УСН Доходы">УСН Доходы</option>
                                        <option value="УСН Доходы минус расходы">УСН Доходы минус расходы</option>
                                        <option value="ЕНВД">ЕНВД</option>
                                        <option value="УСН Доходы">УСН Доходы</option>
                                        <option value="ЕСХН">ЕСХН</option>
                                        <option value="Патентная система">Патентная система</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-row mt-2">
                            <div class="col-12">
                                <h4>Налоговая ставка (%)</h4>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <input type="number"

                                           class="form-control input__text"
                                           placeholder="Введите полное наименование компании"
                                           name="Реквизиты[налоговая_ставка]"
                                           value=""
                                    />
                                </div>
                            </div>
                        </div> -->
                    </div>
                    <div class="form__block">
                        <h2>2. Адреса</h2>
                        <div class="form__wrapper">
                            <div class="form-row">
                                <div class="col-12">
                                    <h4>Юридический адрес</h4>
                                </div>
                                <div class="col-12 legal">
                                    <div class="form-row">
                                        <div class="col-6">
                                            <div class="form-group position-relative">
                                                <label for="">Регион</label>
                                                <select class="custom-select region" name="Адреса[юридический][регион]" value="">
                                                    <option value="Москва">Москва</option>
                                                    <option value="Санкт-Петербург">Санкт-Петербург</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group position-relative">
                                                <label for="">Город</label>
                                                <select class="custom-select city" name="Адреса[юридический][город]" value="">
                                                    <option value="Москва">Москва</option>
                                                    <option value="Санкт-Петербург">Санкт-Петербург</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <label for="">Улица*</label>
                                            <div class="form-group mt-0  position-relative">
                                                <input type="text"
                                                    id="req_ur_street"
                                                    class="form-control street input__text"
                                                    placeholder="Введите полное наименование компании"
                                                    name="Адреса[юридический][улица]"
                                                    value=""
                                                />
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <label for="">Дом*</label>
                                            <div class="form-group mt-0  position-relative">
                                                <input type="text"
                                                    id="req_ur_house"
                                                    class="form-control house input__text"
                                                    placeholder="Введите полное наименование компании"
                                                    name="Адреса[юридический][дом]"
                                                    value=""
                                                />
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <label for="">Офис*</label>
                                            <div class="form-group mt-0  position-relative">
                                                <input type="text"
                                                    id="req_ur_office"
                                                    class="form-control office input__text"
                                                    placeholder="Введите полное наименование компании"
                                                    name="Адреса[юридический][офис]"
                                                    value=""
                                                />
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <label for="">Индекс*</label>
                                            <div class="form-group mt-0  position-relative">
                                                <input type="text"
                                                    id="req_ur_code"
                                                    class="form-control code mask-code input__code"
                                                    placeholder="Введите полное наименование компании"
                                                    name="Адреса[юридический][индекс]"
                                                    value=""
                                                />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="form__wrapper fact mt-3">
                            <div class="form-row">
                                <div class="col-12">
                                    <div class="form-row__checkbox">
                                        <h4>Фактический адрес</h4>
                                        <div class="d-flex align-items-center">
                                            <label class="" for="fact-checkbox">Тот же адрес</label>
                                            <input type="checkbox"
                                                   class="ml-2 j-checkbox-toggle"
                                                   id="fact-checkbox"
                                                   value=""
                                                   checked="checked"
                                            >
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-row j-inputs-content" style="display: none" >
                                <div class="col-6">
                                    <div class="form-group position-relative">
                                        <label for="">Регион</label>
                                        <select class="custom-select region" name="Адреса[фактический][регион]" value="">
                                            <option value="Москва">Москва</option>
                                            <option value="Санкт-Петербург">Санкт-Петербург</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group position-relative">
                                        <label for="">Город</label>
                                        <select class="custom-select city" name="Адреса[фактический][город]" value="">
                                            <option value="Москва">Москва</option>
                                            <option value="Санкт-Петербург">Санкт-Петербург</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <label for="">Улица*</label>
                                    <div class="form-group mt-0  position-relative">
                                        <input type="text"
                                            id="req_fac_street"
                                            class="form-control street input__text"
                                            placeholder="Введите полное наименование компании"
                                            name="Адреса[фактический][улица]"
                                            value=""
                                        />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <label for="">Дом*</label>
                                    <div class="form-group mt-0  position-relative">
                                        <input type="text"
                                            id="req_fac_house"
                                               class="form-control house input__text"
                                               id="" placeholder="Введите полное наименование компании"
                                               name="Адреса[фактический][дом]"
                                               value=""
                                        />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <label for="">Офис*</label>
                                    <div class="form-group mt-0  position-relative">
                                        <input type="text"
                                            id="req_fac_office"
                                               class="form-control office input__text"
                                               placeholder="Введите полное наименование компании"
                                               name="Адреса[фактический][офис]"
                                               value=""
                                        />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <label for="">Индекс*</label>
                                    <div class="form-group mt-0  position-relative">
                                        <input type="text"
                                            id="req_fac_code"
                                               class="form-control code mask-code input__code"
                                               placeholder="Введите полное наименование компании"
                                               name="Адреса[фактический][индекс]"
                                               value=""
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="form__wrapper mail mt-3">
                            <div class="form-row">
                                <div class="col-12">
                                    <div class="form-row__checkbox">
                                        <h4>Почтовый адрес</h4>
                                        <div class="d-flex align-items-center">
                                            <label class="" for="fact-checkbox">Тот же адрес</label>
                                            <input type="checkbox"
                                                    class="ml-2 j-checkbox-toggle"
                                                    id="mail-checkbox"
                                                    value=""
                                                    checked="checked"
                                            >
                                        </div>
                                        <!-- <div class="custom-control custom-checkbox">
                                            <input
                                            
                                                    type="checkbox"
                                                    class="custom-control-input j-checkbox-toggle"
                                                    id="mail-checkbox"
                                                    value=""
                                                    checked="checked"
                                            >
                                            <label class="custom-control-label" for="mail-checkbox">Тот же адрес</label>
                                        </div> -->
                                    </div>
                                </div>
                            </div>
                            <div class="form-row j-inputs-content"  style="display: none">
                                <div class="col-6">
                                    <div class="form-group position-relative">
                                        <label for="">Регион</label>
                                        <select class="custom-select region" name="Адреса[почтовый][регион]" value="">
                                            <option value="Москва">Москва</option>
                                            <option value="Санкт-Петербург">Санкт-Петербург</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group position-relative">
                                        <label for="">Город</label>
                                        <select class="custom-select city" name="Адреса[почтовый][город]" value="">
                                            <option value="Москва">Москва</option>
                                            <option value="Санкт-Петербург">Санкт-Петербург</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <label for="">Улица*</label>
                                    <div class="form-group mt-0  position-relative">
                                        <input type="text"
                                            id="req_mail_street"
                                               class="form-control street input__text"
                                               placeholder="Введите полное наименование компании"
                                               name="Адреса[почтовый][улица]"
                                               value=""
                                        />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <label for="">Дом*</label>
                                    <div class="form-group mt-0  position-relative">
                                        <input type="text"
                                            id="req_mail_house"
                                               class="form-control house input__text"
                                               placeholder="Введите полное наименование компании"
                                               name="Адреса[почтовый][дом]"
                                               value=""
                                        />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <label for="">Офис*</label>
                                    <div class="form-group mt-0  position-relative">
                                        <input type="text"
                                            id="req_mail_office"
                                               class="form-control office input__text"
                                               placeholder="Введите полное наименование компании"
                                               name="Адреса[почтовый][офис]"
                                               value=""
                                        />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <label for="">Индекс*</label>
                                    <div class="form-group mt-0  position-relative">
                                        <input type="text"
                                            id="req_mail_code"
                                               class="form-control code mask-code input__code"
                                               placeholder="Введите полное наименование компании"
                                               name="Адреса[почтовый][индекс]"
                                               value=""
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="form__wrapper delivery mt-3">
                            <div class="form-row">
                                <div class="col-12">
                                    <h4>Адрес доставки</h4>
                                </div>
                                <div class="col-6">
                                    <div class="form-group position-relative">
                                        <label for="">Регион</label>
                                        <select class="custom-select region" name="Адреса[доставка][регион]" value="">
                                            <option value="Москва">Москва</option>
                                            <option value="Санкт-Петербург">Санкт-Петербург</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group position-relative">
                                        <label for="">Город</label>
                                        <select class="custom-select city" name="Адреса[доставка][город]" value="">
                                            <option value="Москва">Москва</option>
                                            <option value="Санкт-Петербург">Санкт-Петербург</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <label for="">Улица*</label>
                                    <div class="form-group mt-0  position-relative">
                                        <input type="text"
                                            id="req_dost_street"
                                               class="form-control street input__text"
                                               placeholder="Введите полное наименование компании"
                                               name="Адреса[доставка][улица]"
                                               value=""
                                        />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <label for="">Дом*</label>
                                    <div class="form-group mt-0  position-relative">
                                        <input type="text"
                                            id="req_dost_house"
                                               class="form-control house input__text"
                                               placeholder="Введите полное наименование компании"
                                               name="Адреса[доставка][дом]"
                                               value=""
                                        />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <label for="">Офис*</label>
                                    <div class="form-group mt-0  position-relative">
                                        <input type="text"
                                            id="req_dost_office"
                                               class="form-control office input__text"
                                               placeholder="Введите полное наименование компании"
                                               name="Адреса[доставка][офис]"
                                               value=""
                                        />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <label for="">Индекс*</label>
                                    <div class="form-group mt-0  position-relative">
                                        <input type="text"
                                            id="req_dost_code"
                                               class="form-control code mask-code input__code"
                                               placeholder="Введите полное наименование компании"
                                               name="Адреса[доставка][индекс]"
                                               value=""
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group col-md-6">
                    <div class="form__block">
                        <h2>3. Банковские реквизиты</h2>
                        <div class="form-row">
                            <div class="col-12">
                                <h4>Название банка*</h4>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <input type="text"
                                        id="req_bank_name"
                                           class="form-control input__text"
                                           placeholder="Введите полное наименование компании"
                                           name="Банковские_реквизиты[название_банка]"
                                           value=""
                                    />
                                </div>
                            </div>
                        </div>
                        <div class="form-row mt-2">
                            <div class="col-12">
                                <h4>Адрес банка*</h4>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <input type="text"
                                        id="req_bank_address"
                                           class="form-control input__text"
                                           placeholder="Введите полное наименование компании"
                                           name="Банковские_реквизиты[адрес]"
                                           value=""
                                    />
                                </div>
                            </div>
                        </div>
                        <div class="form-row mt-2">
                            <div class="col-12">
                                <h4>Расчетный счет*</h4>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <input type="text"
                                        id="req_bank_rs"
                                           class="form-control mask-rs "
                                           placeholder="Введите полное наименование компании"
                                           name="Банковские_реквизиты[расчетный_счет]"
                                           value=""
                                    />
                                </div>

                            </div>
                        </div>
                        <div class="form-row mt-2">
                            <div class="col-12">
                                <h4>БИК банка*</h4>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <input type="text"
                                        id="req_bank_bik"
                                           class="form-control mask-bik "
                                           placeholder="Введите полное наименование компании"
                                           name="Банковские_реквизиты[БИК]"
                                           value=""
                                    />
                                </div>
                            </div>
                        </div>
                        <div class="form-row mt-2">
                            <div class="col-12">
                                <h4>Корреспондентский счет банка*</h4>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <input type="text"
                                        id="req_bank_ks"
                                           class="form-control mask-ks "
                                           placeholder="Введите полное наименование компании"
                                           name="Банковские_реквизиты[кор_счет]"
                                           value=""
                                    />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form__block">
                        <h2>5. Руководящий состав</h2>
                        <div class="form-row">
                            <div class="col-12">
                                <h4>Директор</h4>
                            </div>
                            <div class="col-12">
                                <h5>ФИО</h5>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">

                                    <input type="text"
                                        id="req_dir_fio"
                                           class="form-control input__text"
                                           placeholder="Введите полное наименование компании"
                                           name="Руководство[директор][фио]"
                                           value=""
                                    />
                                </div>
                            </div>
                            <div class="col-12">
                                <h5>Email</h5>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <input type="email"
                                        id="req_dir_email"
                                           class="form-control input__email"
                                           placeholder="Введите полное наименование компании"
                                           name="Руководство[директор][email]"
                                           value=""
                                    />
                                </div>
                            </div>
                            <div class="col-12">
                                <h5>Телефон</h5>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <input type="text"
                                        id="req_dir_phone"
                                           class="form-control mask-phone input__phone"
                                           placeholder="Введите полное наименование компании"
                                           name="Руководство[директор][телефон]"
                                           value=""
                                    />
                                </div>
                            </div>
                        </div>
                        <div class="form-row mt-2">
                            <div class="col-12">
                                <h4>Бухгалтер</h4>
                            </div>
                            <div class="col-12">
                                <h5>ФИО</h5>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <input type="text"
                                        id="req_buh_fio"
                                           class="form-control"
                                           placeholder="Введите полное наименование компании"
                                           name="Руководство[бухгалтер][ФИО]"
                                           value=""
                                    />
                                </div>
                            </div>
                            <div class="col-12">
                                <h5>Email</h5>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <input type="email"
                                        id="req_buh_email"
                                           class="form-control input__email"
                                           placeholder="Введите полное наименование компании"
                                           name="Руководство[бухгалтер][email]"
                                           value=""
                                    />
                                </div>
                            </div>
                            <div class="col-12">
                                <h5>Телефон</h5>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <input type="text"
                                        id="req_buh_phone"
                                           class="form-control mask-phone"
                                           placeholder="Введите полное наименование компании"
                                           name="Руководство[бухгалтер][телефон]"
                                           value=""
                                    />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form__block">
                        <h2>6. Менеджмент</h2>
                        <div class="j-managers">
                        </div>
                        <button type="button" class="btn btn-secondary j-addNew">Добавить</button>
                    </div>
                    <div class="form__block">
                        <h2>7. Документы</h2>
                        <div class="form-row">
                            <h4>Обязательные документы организации</h4>
                            <p>Загрузите учредительные документы для верификации данных вашей компании</p>
                        </div>
                        <div class="form-row">
                            <label for="files" class="mb-1">Свидетельство о регистрации компании *</label>
                            <input type="file" name="files[]" >
                        </div>
                        <div class="form-row mt-2">
                            <label for="files" class="mb-1">Лист записи ЕГРЮЛ *</label>
                            <input type="file" name="files[]" >
                        </div>
                        <div class="form-row mt-3">
                            <label for="files" class="mb-1">Приказ о назначении директора *</label>
                            <input type="file" name="files[]" >
                        </div>
                        <div class="form-row mt-2">
                            <label for="files" class="mb-1">Уведомление о применяемой системе налогообложения</label>
                            <input type="file" name="files[]" >
                        </div>
                    </div>
                </div>
                <div class="col-md-12 d-flex  justify-content-center">
                    <button type="submit"   class="btn btn-primary j-sendRQform">Сохранить данные</button>
                </div>
            </div>
        </form>
    </div>