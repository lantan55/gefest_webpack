{extends 'template:main'}

{block 'main'}
    <div class="mainContent">
        <main class="container">
            <div class="row">
                <div class="pageTop">
                    <div class="col-md-12">
                        <h1>{'pagetitle' | resource}</h1>
                        [[!Breadcrumbs? &homeCrumbTitle=`Гефест` &currentAsLink=`0`]]
                    </div>
                </div>
                <div class="col-md-3 col-xxl-2">
                    {'filter' | chunk}
                    {'subcategory-sidebar' | chunk}
                </div>
                <div class="col-md-9  col-xxl-10">
                    <div id="pdopage">
                        <div class="rows">
                            {'!pdoPage' | snippet:
                                [
                                    'parents' => $_modx->resource.id,
                                    'element' => 'msProducts',
                                    'ajax' => '1',
                                    'frontend_js' => '/assets/components/pdotools/js/pdopage.custom.js',
                                    'ajaxMode' => 'default',
                                    'limit' => '12',
                                    'includeTVs' => 'prokat,size,ostatok,nal,novinka,skidka',
                                    'tvPrefix' => '',
                                    'tplPageActive' => '@INLINE <li class="active"><span class="active-text">[[+pageNo]]</span></li>',
                                ]
                            }
                        </div>
                        {'page.nav' | placeholder}
                    </div>
                    {if !$.get.page}
                        <div class="rowCont">
                            {'content' | resource}
                        </div>
                    {/if}
                </div>
                <!--<div class="col-md-12">-->
                <!--    <div class="opt">-->
                <!--        <div class="col-md-6">-->
                <!--            <h4>Оптовая продажа специальных сплавов и сталей в ЕАЭС быстро и безопасно</h4>-->
                <!--            <p>ГК ГЕФЕСТ поможет вам организовать оптовые закупки Специальных сталей и сплавов, прецизионных и других спец марок по странам ЕАЭС.</p>-->
                <!--            <a href="">Подробнее...</a>-->
                <!--        </div>-->
                <!--        <div class="col-md-6">-->
                <!--            <img src="/assets/img/def.jpg">-->
                <!--        </div>-->
                <!--    </div>-->
                <!--    <div class="zapros">-->
                <!--        <div class="col-md-6">-->
                <!--            <img src="/assets/img/def.jpg">-->
                <!--        </div>-->
                <!--        <div class="col-md-6">-->
                <!--            <h4>Покупайте из первых рук от надежного поставщика</h4>-->
                <!--            <p>Размещайте запросы и получайте предложения напрямую от поставщика</p>-->
                <!--            <a href="">Разместить запрос</a>-->
                <!--        </div>-->
                <!--    </div>-->
                <!--</div>-->
            </div>
            {include 'info-block1'}
        </main>
    </div>
{/block}