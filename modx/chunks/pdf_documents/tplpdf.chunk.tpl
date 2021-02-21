<table style="width: 100%; border: 1px solid black; border-collapse: collapse;">
    <tbody>
        <tr>
            <td style="text-align: left; padding: 5px; border: 1px solid black;" colspan="4" rowspan="2">
                {$seller.req_bank_name}
            </td>
            <td style="text-align: left; padding: 5px; border: 1px solid black;" >БИК</td>
            <td style="text-align: left; padding: 5px; border: 1px solid black;">{$seller.req_bik}</td>
        </tr>
        <tr>            
            <td style="text-align: left; padding: 5px; border: 1px solid black;height: 40px; vertical-align: top;" rowspan="2">Сч. № </td>
            <td style="text-align: left; padding: 5px; border: 1px solid black;height: 40px; vertical-align: top;"  rowspan="2">{$seller.req_rs}</td>
        </tr>
        <tr>
            <td style="text-align: left; padding: 5px; border: 1px solid black;" colspan="4">Банк получателя</td>
        </tr>
        <tr>
            <td style="text-align: left; padding: 5px; border: 1px solid black; width: 60px;">ИНН</td>
            <td style="text-align: left; padding: 5px; border: 1px solid black;">{$seller.req_inn}</td>
            <td style="text-align: left; padding: 5px; border: 1px solid black; width: 60px;">КПП</td>
            <td style="text-align: left; padding: 5px; border: 1px solid black;">{$seller.req_inn}</td>
            <td style="text-align: left; padding: 5px; border: 1px solid black; vertical-align: top;" rowspan="3">Сч. №</td>
            <td style="text-align: left; padding: 5px; border: 1px solid black; vertical-align: top;" rowspan="3">{$seller.req_ks}</td>
        </tr>
        <tr>
            <td style="text-align: left; padding: 5px; border: 1px solid black;height: 20px; vertical-align: top; border-bottom: none;" colspan="4">{$seller.req_name}</td>
        </tr>
        <tr>
            <td style="text-align: left; padding: 5px; border: 1px solid black;border-top:none;" colspan="4">Получатель</td>
        </tr>
    </tbody>
</table>

<h1 style="margin-top: 10px;margin-bottom: 5px; font-size: 18px; font-weight: 600;">Счет на оплату № {$invoice_id} от {$current_date}</h1>
<hr style="margin-top: 0;margin-bottom: 5px;">
<table style="width: 100%;margin-top: 5px;margin-bottom: 5px;">
    <tbody>
        <tr>
            <td style="text-align: left; width: 120px;">Поставщик <br/> (Исполнитель):</td>
            <td >
                <p>
                    {$seller.req_name}, 
                    ИНН {$seller.req_inn},
                    КПП {$seller.req_inn},
                    {$seller.req_address},
                    {$seller.req_phone}
                </p>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; width: 120px;">Покупатель <br/> (Заказчик):</td>
            <td>
                <p>
                    {$customer.Реквизиты.название}, 
                    ИНН {$customer.Реквизиты.ИНН},
                    {$customer.Адреса.юридический.индекс},
                    {$customer.Адреса.юридический.город},
                    {$customer.Адреса.юридический.улица},
                    {$customer.Адреса.юридический.дом},
                    {$customer.Адреса.юридический.офис},
                </p>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; width: 120px;">Основание:</td>
            <td>Счет № {$invoice_id} от {$current_date}</td>
        </tr>
    </tbody>l
</table>

<table style="width: 100%; border: 1px solid black; border-collapse: collapse;margin-top: 5px;margin-bottom: 5px;">
    <thead>
        <tr>
            <th style="text-align: left; padding: 5px; border: 1px solid black;">№</th>
            <th style="text-align: left; padding: 5px; border: 1px solid black;">Товары (работы, услуги)</th>
            <th style="text-align: left; padding: 5px; border: 1px solid black;">Кол-во</th>
            <th style="text-align: left; padding: 5px; border: 1px solid black;">Ед.</th>
            <th style="text-align: left; padding: 5px; border: 1px solid black;">Цена</th>
            <th style="text-align: left; padding: 5px; border: 1px solid black;">Сумма</th>
        </tr>
    </thead>
    <tbody>
        {var $n = 0}
        {var $currentSum = 0}
        {var $currentCount = 0}
        {foreach $data as $r => $dataRow}
            {$n++}
            <tr>
                <td style="padding: 5px; border: 1px solid black;">{$n}</td>
                <td style="padding: 5px; border: 1px solid black;">{$dataRow['name']}</td>
                <td style="padding: 5px; border: 1px solid black;">{$dataRow['count']}</td>
                <td style="padding: 5px; border: 1px solid black;">кг</td>
                <td style="padding: 5px; border: 1px solid black;">{$dataRow['price'] | fixPrice}</td>
                <td style="padding: 5px; border: 1px solid black;">{($dataRow['count'] * $dataRow['price']) | fixPrice}</td>
            </tr>
            
            {$currentSum += $dataRow['count'] * $dataRow['price']}
            {$currentCount += $dataRow['count']}
        {/foreach}
    </tbody>
</table>
<table  style="width: 100%; margin-top: 5px;margin-bottom: 5px;">
    <tbody>
        <tr>
            <td  style="width: 80%; text-align:right;"><strong>Итого:</strong></td>
            <td style="width: 20%; text-align:right;"><strong>{$currentSum | fixPrice}</strong></td>
        </tr>
        <tr>
            <td  style="width: 80%; text-align:right;"><strong>Сумма НДС:</strong></td>
            <td style="width: 20%; text-align:right;"><strong>{($currentSum * 0.2) | fixPrice}</strong></td>
        </tr>
        <tr>
            <td style="width: 80%; text-align:right;"><strong>Всего к оплате:</strong></td>
            <td style="width: 20%; text-align:right;"><strong>{$total | fixPrice}</strong></td>
        </tr>
    </tbody>
</table>
<p style="width: 100%; margin-top: 5px;">
    Всего наименований {$n}, на сумму {$total | fixPrice} руб.																																																							
</p>
<p style="width: 100%;font-weight: bold;margin-top: 5px;">
    {'prescritionSum' | snippet : [
        'sum' => $total
    ]}
</p>
<p style="width: 100%;"></p>
<p style="width: 100%;margin-top: 5px;">
    Оплатить не позднее {$current_date | datePlusThreeDays}
</p>
<p style="width: 100%;margin-top: 5px;">
    Оплата данного счета означает согласие Покупателя с условием поставки товара:
</p>
<ol style="width: 100%;margin-top: 5px;">
    <li>Поставщик обязуется передать Покупателю, а Покупатель обязуется принять и оплатить товары, указанные в настоящем счете.</li>
    <li>Вид, количество, ассортимент, комплектность, характеристики, и иные данные о поставляемом товаре содержатся в настоящем счете.</li>
    <li>Покупатель обязуется оплатить товар в течении 3 рабочих дней.</li>
    <li>Отгрузка товаров на оклад для выдачи Покупателю осуществляется Поставщиком в течении 3 рабочих дней со дня оплаты Покупателем стоимости товаров в размере 100%.</li>
    <li>Поставка осуществляется путем выборки товара Покупателем на складе Поставщика (самовывозом).</li>
    <li>При получении товара Покупатель обязан осмотреть товар, проверить его количество, качество и ассортимент. В случае отсутствия претензий к количеству, качеству или ассортименту товара уполномоченный представитель Покупателя подписывает товарную накладную. В случае наличия претензий к количеству, качеству или ассортименту товара, уполномоченные представители Поставщика и Покупателя подписывают акт об обнаружении недостатков товара.</li>
    <li>Счет действителен в течении 3-х рабочих дней.</li>
</ol>
<hr  style="width: 100%;margin-top: 0;margin-bottom: 5px;">
<table style="width: 100%;">
    <tbody>
        <tr>
            <td>Руководитель</td>
            <td style="border-bottom: 1px solid #000;vertical-align: bottom;"><img width="120" src="{$seller.req_sign}" alt=""></td>
            <td style="border-bottom: 1px solid #000;vertical-align: bottom;">({$seller.req_dir_name_short})</td>
            <td>Бухгалтер</td>
            <td style="border-bottom: 1px solid #000;vertical-align: bottom;"><img width="120" src="{$seller.req_sign}" alt=""></td>
            <td style="border-bottom: 1px solid #000;vertical-align: bottom;">({$seller.req_buh_name_short})</td>
        </tr>
    </tbody>
</table>
<p style="width: 100%; margin-top: 10px;"><img width="200" height="200" src="{$seller.req_print}" alt=""></p>