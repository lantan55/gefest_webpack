<footer>
    <div class="container">
        <div class="row">
            <div class="col-3">
                <a class="logo" href="/"><img src="/assets/img/logoFooter.png" alt="Гефест" width="200"></a>
                <div class="fCont">
                    {if 1==2}<span class="mnogo">Многоканальный</span>
                        <a class="tel" href="tel:84956637095">+7 (495) 663-70-95</a>{/if}
                    <p>
                        Почта:
                        <br>
                        <a class="mail" href="mailto:{'main_email' | config}">{'main_email' | config}</a>
                    </p>
                </div>
                <div class="adr">
                    <p>
                        Адрес: <br>
                        {'main_address' | config}
                    </p>
                    <p>
                        Время работы:
                        <br>
                        {'main_timeline' | config}
                    </p>
                </div>
            </div>

            <div class="col-2">
                <span class="fZag">Партнерам</span>
                <ul class="fLi">
                    <li><a href="{53 | url}" >Стать партнёром</a></li>
                    <li><a  data-fancybox data-src="#sendQuestion" href="javascript;;" >Задать вопрос</a></li>
                </ul>
            </div>
            <div class="col-2">
                <span class="fZag">Покупателям</span>
                <ul class="fLi">
                    <li><a href="{69 | url}" >Все товары</a></li>
                    <li><a href="{57 | url}" >Товары с бесплатной доставкой</a></li>
                    <li><a href="{58 | url}" >Товары со скидкой</a></li>
                    <li><a data-fancybox data-src="#sendForm" href="javascript;;">Разместить запрос</a></li>
                </ul>
            </div>
            <div class="col-2">
                <span class="fZag">О нас</span>
                <ul class="fLi">
                    {'pdoMenu' | snippet : [
                    'parents' => '61',
                    'tplOuter' => '@INLINE {$wrapper}',
                    'tpl' => '@INLINE <li><a href="{$link}" {$attributes}>{$menutitle}</a>{$wrapper}</li>'
                    ]}
                    <li><a href="https://www.facebook.com/" target="_blank">Мы на Facebook</a></li>
                </ul>
            </div>
            <div class="col-3">
                <span class="fZag">Способы оплаты</span>
                <img src="/assets/img/payments.png" alt="Способы оплаты" class="fImg">
                <span class="fZag">Наши партнеры</span>
                <img src="/assets/img/f2.jpg" alt="Способы оплаты" class="fImg">
                <span class="fZag">Присоединяйтесь к нам</span>
                <ul class="fSoc">


                    {if 'social_fb' | config}
                        <li><a href="{'social_fb' | config}" class="facebook"></a></li>
                    {/if}
                    {if 'social_vk' | config}
                        <li><a href="{'social_vk' | config}" class="facebook"></a></li>
                    {/if}
                    {if 'social_inst' | config}
                        <li><a href="{'social_inst' | config}" class="facebook"></a></li>
                    {/if}
                </ul>
            </div>

        </div>
    </div>
</footer>
<div class="foot">
    <div class="container">
        <div class="row">
            <div class="col-4">
                <div class="copy">© 1998 – [[currentYear]] ООО «Гефест». Все права защищены.</div>
            </div>
            <div class="col-8">
                <ul class="policy"> <li><a href="/user-agreement">Пользовательское соглашение</a></li> <li><a href="/policies-confidential">Политика конфиденциальности</a></li> <li><a href="/policies-personal-data-processing">Политика обработки персональных данных</a></li> </ul>
            </div>
        </div>
    </div>
</div>