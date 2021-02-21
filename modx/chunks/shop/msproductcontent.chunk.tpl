<!-- <div class="text-center text-md-left mb-2 mb-md-0 mscs">
    [[+old_price:isnot=``:then=`<span class="badge badge-secondary badge-pill col-auto skid">-[[skidka? &price=`{$price}` &old_price=`{$old_price}`]] %</span>`]]
    [[+new:isnot=``:then=`<span class="badge badge-secondary badge-pill col-auto new">[[%ms2_frontend_new]]</span>`]]
    [[+popular:isnot=``:then=`<span class="badge badge-secondary badge-pill col-auto pop">[[%ms2_frontend_popular]]</span>`]]
    [[+favorite:isnot=``:then=`<span class="badge badge-secondary badge-pill col-auto fav">[[%ms2_frontend_favorite]]</span>`]]
</div> -->
<div id="msProduct" class="row align-items-start">
    <form class="form-horizontal ms2_form" method="post">
        <div class="col-12 col-md-6">
            {'msGallery' | snippet}
        </div>
        <div class="col-12 col-md-6">
            
                <input type="hidden" name="id" value="{'id' | resource}"/>
                {if $_modx->isAuthenticated()}
                    {if $_modx->user.id | ismember : 'Подтвержденные'}
                        <div class="row">
                            <div class="col-12 d-flex justify-content-end">
                                <a class="btn btn-secondary"  data-fancybox data-src="#sendProductQuestion" href="javascript;;">Задать вопрос</a>
                            </div>
                        </div>
                    {/if}
                {/if}
                <div class="row">
                    <div class="col-12">
                        <h1>{$_modx->resource.pagetitle}</h1>
                    </div>
                </div>
                <div class="row product-options">
                    <div class="col-12">
                        <div class="product-options__title">
                            Размер (диаметр/толщина): <strong>{$_modx->resource.razmer[0]}</strong>
                        </div>
                    </div>
                    <div class="col-6 mt-2">
                        <div class="product-options__title">
                            Доп размер (длина,ширина,высота): <strong>{$_modx->resource.razmer_dop[0]}</strong>
                        </div>
                    </div>
                    <div class="col-6 mt-2">
                        <div class="product-options__title">
                            Кол. штук/упаковка: <strong>{$_modx->resource.kolichestvo[0]}</strong>
                        </div>
                    </div>
                    <div class="col-12 mt-2">
                        <div class="product-options__title">
                            Минимальная отгрузка(кг): <strong>{$_modx->resource.min_otgruzka[0]}</strong>
                        </div>
                    </div>
                </div>
                
                <hr />
                <div class="row product-price">
                    <div class="col-12">
                        <div class="product-price__value">
                            Цена: 
                            [[+old_price:gt=`0`:then=`
                                <span class="old_price text-danger mr-2">
                                    [[+old_price]] [[%ms2_frontend_currency]]</span>
                            `:else=``]]
                            [[+price]] [[%ms2_frontend_currency]]
                            <span class="product-price__notify">
                                (все цены указаны за кг без учета НДС)
                            </span>
                        </div>
                    </div>
                </div>

                <div class="row product-options">
                    <div class="col-6 mt-2">
                        <div class="product-options__title">
                            Срок поставки: <strong>из наличии</strong>
                        </div>
                    </div>
                    <div class="col-6 mt-2">
                        <div class="product-options__title">
                            На остатке: <strong>{$_modx->resource.vs_na_ostatke[0]} кг</strong>
                        </div>
                    </div>
                    {if $_modx->resource.otgruzka_nestandart[0] !== 'нет'}
                        <div class="col-12 mt-2">
                            <div class="product-options__title">
                                Нестандартная отгрузка: <strong>{$_modx->resource.otgruzka_nestandart[0]} кг</strong>
                            </div>
                        </div>
                        <div class="col-12 mt-2">
                            <div class="product-options__title">
                                Наценка за нестандартную отгрузку: <strong>{$_modx->resource.nacenka[0]} кг</strong>
                            </div>
                        </div>
                    {/if}
                </div>
        </div>
        <hr>
        <div class="col-12 row">
            <div class="col-2 recent">
                <h6>Недавно просмотренные товары</h6>
                <div class="owl-carousel owl-theme  carousel-recent" id="slider4">

                    <div class="item">
                        {'!pdoPage' | snippet:
                            [
                                'parents' => '2',
                                'element' => 'msProducts',
                                'ajax' => '1',
                                'frontend_js' => '/assets/components/pdotools/js/pdopage.custom.js',
                                'ajaxMode' => 'default',
                                'limit' => '2',
                                'includeTVs' => 'prokat,size,ostatok,nal,novinka,skidka',
                                'tvPrefix' => '',
                                'tpl' => 'slider',
                                'tplPageActive' => '@INLINE <li class="active"><span class="active-text">[[+pageNo]]</span></li>',
                            ]
                        }
                        
                    </div>              
                </div>
            </div>
            <div class="col-10">
                <div class="row">
                    <div class="col-6">
                        <h5>Дополнительные параметры:</h5>
                        <table class="table table-bordered product-table">
                            <tbody>
                                <tr>
                                    <td>
                                        Обработка:
                                    </td>
                                    <td>
                                        {$_modx->resource.obrabotka[0]}
                                    </td>
                                </tr>   
                                <tr>
                                    <td>
                                        ТНД:
                                    </td>
                                    <td>
                                        {$_modx->resource.tnd[0]}
                                    </td>
                                </tr>  
                                <tr>
                                    <td>
                                        Маркировка:
                                    </td>
                                    <td>
                                        {$_modx->resource.markirovka[0]}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Документ:
                                    </td>
                                    <td>
                                        {$_modx->resource.document[0]}
                                    </td>
                                </tr>  
                                <tr>
                                    <td>
                                        Доставка:
                                    </td>
                                    <td>
                                        Самовывоз со склада
                                    </td>
                                </tr>     
                            </tbody>
                        </table>
                    </div>
                    <div class="col-6">
                        <div class="row">
                            <div class="col-12">
                                <h5>Оформление заказа:</h5>
                            </div>
                            <div class="col-12 d-flex justify-content-between">
                                <span>Укажите/выберите кол-во</span> 
                                <input type="number" name="count" id="product_price" class="form-control col-md-6" value="1"/>
                            </div>
                            <div class="col-12 row">
                                {if $_modx->resource.ves_v_kg[0]}
                                    {var $sizes = $_modx->resource.ves_v_kg[0] | split: ';'}
                                    {foreach $sizes as $size}
                                        <div class="btn-group-toggle" data-toggle="buttons">                                        
                                            <label class="btn btn-secondary ">
                                                <input type="checkbox" checked autocomplete="off"> {$size}
                                            </label>
                                        </div> 
                                    {/foreach}
                                {/if}
                            </div> 
                            <div class="col-12 row mt-4">
                                
                                
                            </div>
                        </div>
                        {if $_modx->isAuthenticated()}
                            {if $_modx->user.id | ismember : 'Подтвержденные'}
                                <div class="row justify-content-center mt-4">
                                    <div class="col-6 ">
                                        <button class="btn btn-success btn-block" type="submit" name="ms2_action" value="cart/add">
                                            {'ms2_frontend_add_to_cart' | lexicon}
                                        </button>
                                    </div>
                                </div>
                            {else}
                                <div class="row justify-content-start mt-4">
                                    <div class="col-8 ">
                                        <div class="ms2_product__notify">
                                            Для покупки необходимо заполнить <a href="{'37' | url}">реквизиты</a> и дождаться активации профиля компании
                                        </div>
                                    </div>
                                </div>
                            {/if}
                        {else}
                            <div class="row justify-content-start mt-4">
                                <div class="col-8 ">
                                    <div class="ms2_product__notify">
                                        Для покупки необходимо <a href="{'41' | url}">зарегистрироваться</a>
                                    </div>
                                </div>
                            </div>
                        {/if}
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 mt-4 req-tabs">
                        {set $tabsRows = json_decode($_modx->resource.product_desc, true)}
                        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                            {foreach $tabsRows as $row}

                                <li class="nav-item">
                                    <a class="nav-link {if $row.MIGX_id === '1' }active{/if}" id="pills-tab{$row.MIGX_id}" data-toggle="pill" href="#pills-{$row.MIGX_id}" role="tab" aria-controls="pills-{$row.MIGX_id}" aria-selected="true">{$row.title}</a>
                                </li>
                            {/foreach}
                        </ul>
                        <div class="tab-content" id="pills-tabContent">
                            {foreach $tabsRows as $row}
                                <div class="tab-pane fade show {if $row.MIGX_id === '1' }active{/if}" id="pills-{$row.MIGX_id}" role="tabpanel" >
                                    {$row.text}
                                </div>
                            {/foreach}
                        </div>

                        
                    </div>
                </div>
            </div>
            <hr />
        </div>
    </form>
</div>
{include 'carousel-custom'}
{include 'carousel-custom'}
<div class="mt-3">
    [[*content]]
</div>

