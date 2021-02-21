{extends 'template:main'}

{block 'main'}
    <div class="mainContent">
        <main class="container">
            <div class="row">

                <div class="pageTop">
                    <div class="col-md-12">

                        <h1>{$_modx->resource.pagetitle}</h1>
                        [[!Breadcrumbs? &homeCrumbTitle=`Гефест` &currentAsLink=`0`]]

                    </div>
                </div>

                <!-- <div class="col-md-3 col-xxl-2">

                    <div class="filterBar">

                        <div class="vibor col-sm-12">
                            <div class="nameF">Фильтр</div>
                            <div class="vib" style="display:none">Выбранные свойства</div>
                            <div class="prokatV"></div>
                            <div class="sizeV"></div>
                        </div>
                        <form class="form-horizontal" id="filters" action="">

                            <input type="hidden" name="prokat">
                            <input type="hidden" name="size">
                            <input type="hidden" name="novinka" value="1">


                            <div class="form-group">
                                <label class="col-sm-12 control-label">Тип проката</label>
                                <div class="col-sm-12" id="prokat">
                                    [[!filter? &tvname=`prokat` &id=`0` &type=`novinka`]]
                                </div>
                                <label class="col-sm-12 control-label">Размер</label>
                                <div class="col-sm-12" id="size">
                                    [[!filter? &tvname=`size` &id=`0` &type=`novinka`]]
                                </div>
                            </div>
                            <div class="col-md-12">
                                <a href="#" id="clear">Очистить фильтр</a>
                            </div>



                        </form>
                    </div>
                    <hr>
                    {$_modx->getChunk('leftMenu')}


                </div> -->
                <div class="col-md-9  col-xxl-10">
                    <div id="pdopage">

                        <div class="rows">
                            {'!pdoPage' | snippet:
                            [
                            'parents' => '0',
                            'element' => 'msProducts',
                            'ajax' => '1',
                            'frontend_js' => '/assets/components/pdotools/js/pdopage.custom.js',
                            'ajaxMode' => 'default',
                            'limit' => '12',
                            'includeTVs' => 'prokat,size,ostatok,nal,novinka,skidka',
                            'tvPrefix' => '',
                            'tplPageActive' => '@INLINE <li class="active"><span class="active-text">[[+pageNo]]</span></li>',
                            'where' => ['novinka = "1"']
                            ]
                            }




                        </div>

                        {$_modx->getPlaceholder('page.nav')}

                    </div>
                    {if !$.get.page}
                        <div class="rowCont">
                            {$_modx->resource.content}
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