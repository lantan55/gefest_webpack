<div class="col-12 mt-4 req-tabs">
    {if $.get.updpsuccess}
        <div class="col-12">
            <span class="success">
                Спасибо! Ваши данные отправлены на проверку менеджеру
            </span>
        </div>
    {/if}
    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-req" role="tab" aria-controls="pills-req" aria-selected="true">Реквизиты компании</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-address" role="tab" aria-controls="pills-address" aria-selected="false">Адреса</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">Контакты</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-doc" role="tab" aria-controls="pills-doc" aria-selected="false">Документы</a>
        </li>
    </ul>
    <div class="tab-content" id="pills-tabContent">
        <div class="tab-pane fade show active" id="pills-req" role="tabpanel" aria-labelledby="pills-home-tab">
            <table class="table table-striped table-bordered table-sm table-light table__req">
                <thead>
                    <tr>
                        <th colspan="2">Реквизиты компании</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="title">Форма собственности:</td>
                        <td>{$_modx->user.extended.Реквизиты.форма_собственности}</td>
                    </tr>
                    <tr>
                        <td class="title">Имя компании:</td>
                        <td>{$_modx->user.extended.Реквизиты.название}</td>
                    </tr>
                    <tr>
                        <td class="title">Полное имя компании:</td>
                        <td>{$_modx->user.extended.Реквизиты.полное_наименование}</td>
                    </tr>
                    <tr>
                        <td class="title">Телефон:</td>
                        <td>{$_modx->user.extended.Реквизиты.телефон}</td>
                    </tr>
                    <tr>
                        <td class="title">ИНН:</td>
                        <td>{$_modx->user.extended.Реквизиты.ИНН}</td>
                    </tr>
                    <tr>
                        <td class="title">КПП:</td>
                        <td>{$_modx->user.extended.Реквизиты.КПП}</td>
                    </tr>
                    <tr>
                        <td class="title">ОГРН:</td>
                        <td>{$_modx->user.extended.Реквизиты.ОГРН}</td>
                    </tr>
                    <tr>
                        <td class="title">ОКПО:</td>
                        <td>{$_modx->user.extended.Реквизиты.ОКПО}</td>
                    </tr>
                    <tr>
                        <td class="title">ОКВЭД:</td>
                        <td>{$_modx->user.extended.Реквизиты.ОКВЭД}</td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-striped table-bordered mt-2 table-sm table-light table__req">
                <thead>
                <tr>
                    <th colspan="2">Банковские реквизиты</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="title">Название банка:</td>
                    <td>{$_modx->user.extended.Банковские_реквизиты.название_банка}</td>
                </tr>
                <tr>
                    <td class="title">Адрес банка:</td>
                    <td>{$_modx->user.extended.Банковские_реквизиты.адрес}</td>
                </tr>
                <tr>
                    <td class="title">Расчетный счет:</td>
                    <td>{$_modx->user.extended.Банковские_реквизиты.расчетный_счет}</td>
                </tr>
                <tr>
                    <td class="title">БИК банка:</td>
                    <td>{$_modx->user.extended.Банковские_реквизиты.БИК}</td>
                </tr>
                <tr>
                    <td class="title">Корреспондентский счет:</td>
                    <td>{$_modx->user.extended.Банковские_реквизиты.кор_счет}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-pane fade" id="pills-address" role="tabpanel" aria-labelledby="pills-profile-tab">
            <table class="table table-striped table-bordered mt-2 table-sm  table-light table__req">
                <thead>
                <tr>
                    <th colspan="2">Адреса</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td colspan="2"><strong>Юридический адрес:</strong></td>
                </tr>
                <tr>
                    <td class="title">Регион:</td>
                    <td>{$_modx->user.extended.Адреса.юридический.регион}</td>
                </tr>
                <tr>
                    <td class="title">Город:</td>
                    <td>{$_modx->user.extended.Адреса.юридический.город}</td>
                </tr>
                <tr>
                    <td class="title">Улица:</td>
                    <td>{$_modx->user.extended.Адреса.юридический.улица}</td>
                </tr>
                <tr>
                    <td class="title">Дом:</td>
                    <td>{$_modx->user.extended.Адреса.юридический.дом}</td>
                </tr>
                <tr>
                    <td class="title">Офис:</td>
                    <td>{$_modx->user.extended.Адреса.юридический.офис}</td>
                </tr>
                <tr>
                    <td class="title">Индекс:</td>
                    <td>{$_modx->user.extended.Адреса.юридический.индекс}</td>
                </tr>
                <tr>
                    <td colspan="2"><strong>Фактический адрес:</strong></td>
                </tr>
                <tr>
                    <td class="title">Регион:</td>
                    <td>{$_modx->user.extended.Адреса.фактический.регион}</td>
                </tr>
                <tr>
                    <td class="title">Город:</td>
                    <td>{$_modx->user.extended.Адреса.фактический.город}</td>
                </tr>
                <tr>
                    <td class="title">Улица:</td>
                    <td>{$_modx->user.extended.Адреса.фактический.улица}</td>
                </tr>
                <tr>
                    <td class="title">Дом:</td>
                    <td>{$_modx->user.extended.Адреса.фактический.дом}</td>
                </tr>
                <tr>
                    <td class="title">Офис:</td>
                    <td>{$_modx->user.extended.Адреса.фактический.офис}</td>
                </tr>
                <tr>
                    <td class="title">Индекс:</td>
                    <td>{$_modx->user.extended.Адреса.фактический.индекс}</td>
                </tr>
                <tr>
                    <td colspan="2"><strong>Почтовый адрес:</strong></td>
                </tr>
                <tr>
                    <td class="title">Регион:</td>
                    <td>{$_modx->user.extended.Адреса.почтовый.регион}</td>
                </tr>
                <tr>
                    <td class="title">Город:</td>
                    <td>{$_modx->user.extended.Адреса.почтовый.город}</td>
                </tr>
                <tr>
                    <td class="title">Улица:</td>
                    <td>{$_modx->user.extended.Адреса.почтовый.улица}</td>
                </tr>
                <tr>
                    <td class="title">Дом:</td>
                    <td>{$_modx->user.extended.Адреса.почтовый.дом}</td>
                </tr>
                <tr>
                    <td class="title">Офис:</td>
                    <td>{$_modx->user.extended.Адреса.почтовый.офис}</td>
                </tr>
                <tr>
                    <td class="title">Индекс:</td>
                    <td>{$_modx->user.extended.Адреса.почтовый.индекс}</td>
                </tr>
                <tr>
                    <td colspan="2"><strong>Адрес доставки:</strong></td>
                </tr>
                <tr>
                    <td class="title">Регион:</td>
                    <td>{$_modx->user.extended.Адреса.доставка.регион}</td>
                </tr>
                <tr>
                    <td class="title">Город:</td>
                    <td>{$_modx->user.extended.Адреса.доставка.город}</td>
                </tr>
                <tr>
                    <td class="title">Улица:</td>
                    <td>{$_modx->user.extended.Адреса.доставка.улица}</td>
                </tr>
                <tr>
                    <td class="title">Дом:</td>
                    <td>{$_modx->user.extended.Адреса.доставка.дом}</td>
                </tr>
                <tr>
                    <td class="title">Офис:</td>
                    <td>{$_modx->user.extended.Адреса.доставка.офис}</td>
                </tr>
                <tr>
                    <td class="title">Индекс:</td>
                    <td>{$_modx->user.extended.Адреса.доставка.индекс}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
            <table class="table table-striped table-bordered mt-2 table-sm  table-light table__req">
                <thead>
                <tr>
                    <th colspan="2">Руководящий состав</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="2">Директор</td>
                    </tr>
                    <tr>
                        <td class="title">ФИО ответственного лица:</td>
                        <td>{$_modx->user.extended.Руководство.директор.фио}</td>
                    </tr>
                    <tr>
                        <td class="title">Адрес электронной почты:</td>
                        <td>{$_modx->user.extended.Руководство.директор.email}</td>
                    </tr>
                    <tr>
                        <td class="title">Телефон:</td>
                        <td>{$_modx->user.extended.Руководство.директор.телефон}</td>
                    </tr>
                    {if $_modx->user.extended.Руководство.бухгалтер.фио}
                        <tr>
                            <td colspan="2">Бухгалтер</td>
                        </tr>
                        <tr>
                            <td class="title">ФИО бухгалтера:</td>
                            <td>{$_modx->user.extended.Руководство.бухгалтер.фио}</td>
                        </tr>
                        <tr>
                            <td class="title">Адрес электронной почты:</td>
                            <td>{$_modx->user.extended.Руководство.бухгалтер.email}</td>
                        </tr>
                        <tr>
                            <td class="title">Телефон:</td>
                            <td>{$_modx->user.extended.Руководство.бухгалтер.телефон}</td>
                        </tr>
                    {/if}
                </tbody>
            </table>
            <table class="table table-striped table-bordered mt-2 table-sm  table-light table__req">
                <thead>
                <tr>
                    <th colspan="2">Менеджмент</th>
                </tr>
                </thead>
                <tbody>
                {if $_modx->user.extended.Менеджмент.сотрудник1.фио}
                    <tr>
                        <td colspan="2"><strong>Сотрудник 1</strong></td>
                    </tr>
                    <tr>
                        <td class="title">ФИО сотрудника:</td>
                        <td>{$_modx->user.extended.Менеджмент.сотрудник1.фио}</td>
                    </tr>
                    <tr>
                        <td class="title">Адрес электронной почты:</td>
                        <td>{$_modx->user.extended.Менеджмент.сотрудник1.email}</td>
                    </tr>
                    <tr>
                        <td class="title">Телефон:</td>
                        <td>{$_modx->user.extended.Менеджмент.сотрудник1.телефон}</td>
                    </tr>
                {/if}
                {if $_modx->user.extended.Менеджмент.сотрудник2.фио}
                    <tr>
                        <td colspan="2"><strong>Сотрудник 2</strong></td>
                    </tr>
                    <tr>
                        <td class="title">ФИО сотрудника:</td>
                        <td>{$_modx->user.extended.Менеджмент.сотрудник2.фио}</td>
                    </tr>
                    <tr>
                        <td class="title">Адрес электронной почты:</td>
                        <td>{$_modx->user.extended.Менеджмент.сотрудник2.email}</td>
                    </tr>
                    <tr>
                        <td class="title">Телефон:</td>
                        <td>{$_modx->user.extended.Менеджмент.сотрудник2.телефон}</td>
                    </tr>
                {/if}
                {if $_modx->user.extended.Менеджмент.сотрудник3.фио}
                    <tr>
                        <td colspan="2"><strong>Сотрудник 3</strong></td>
                    </tr>
                    <tr>
                        <td class="title">ФИО сотрудника:</td>
                        <td>{$_modx->user.extended.Менеджмент.сотрудник3.фио}</td>
                    </tr>
                    <tr>
                        <td class="title">Адрес электронной почты:</td>
                        <td>{$_modx->user.extended.Менеджмент.сотрудник3.email}</td>
                    </tr>
                    <tr>
                        <td class="title">Телефон:</td>
                        <td>{$_modx->user.extended.Менеджмент.сотрудник3.телефон}</td>
                    </tr>
                {/if}
                {if $_modx->user.extended.Менеджмент.сотрудник4.фио}
                    <tr>
                        <td colspan="2"><strong>Сотрудник 4</strong></td>
                    </tr>
                    <tr>
                        <td class="title">ФИО сотрудника:</td>
                        <td>{$_modx->user.extended.Менеджмент.сотрудник4.фио}</td>
                    </tr>
                    <tr>
                        <td class="title">Адрес электронной почты:</td>
                        <td>{$_modx->user.extended.Менеджмент.сотрудник4.email}</td>
                    </tr>
                    <tr>
                        <td class="title">Телефон:</td>
                        <td>{$_modx->user.extended.Менеджмент.сотрудник4.телефон}</td>
                    </tr>
                {/if}
                {if $_modx->user.extended.Менеджмент.сотрудник5.фио}
                    <tr>
                        <td colspan="2"><strong>Сотрудник 5</strong></td>
                    </tr>
                    <tr>
                        <td class="title">ФИО сотрудника:</td>
                        <td>{$_modx->user.extended.Менеджмент.сотрудник5.фио}</td>
                    </tr>
                    <tr>
                        <td class="title">Адрес электронной почты:</td>
                        <td>{$_modx->user.extended.Менеджмент.сотрудник5.email}</td>
                    </tr>
                    <tr>
                        <td class="title">Телефон:</td>
                        <td>{$_modx->user.extended.Менеджмент.сотрудник5.телефон}</td>
                    </tr>
                {/if}
                </tbody>
            </table> 
        </div>
        <div class="tab-pane fade req-tabs__img" id="pills-doc" role="tabpanel" aria-labelledby="pills-contact-tab">
            <div class="row">
                {if $_modx->user.user_document1}
                    <div class="col-3 text-center">
                        <h4>Свидетельство о регистрации компании</h4>
                        <img src="{$_modx->user.user_document1}" alt="">
                    </div>    
                {/if}
                {if $_modx->user.user_document2}
                    <div class="col-3 text-center">
                        <h4>Лист записи ЕГРЮЛ</h4>
                        <img src="{$_modx->user.user_document2}" alt="">
                    </div>    
                {/if}
                {if $_modx->user.user_document3}
                    <div class="col-3 text-center">
                        <h4>Приказ о назначении директора</h4>
                        <img src="{$_modx->user.user_document3}" alt="">
                    </div>    
                {/if}
                {if $_modx->user.user_document4}
                    <div class="col-3 text-center">
                        <h4>Уведомление о применяемой системе налогообложения</h4>
                        <img src="{$_modx->user.user_document4}" alt="">
                    </div>    
                {/if}
            </div>
        </div>
    </div>
</div>