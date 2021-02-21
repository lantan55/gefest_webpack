<section class="carousel">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h3 >Товары со скидкой</h3>
            </div>
            <div class="owl-carousel owl-theme carousel-slider" id="slider1">
                {'!pdoPage' | snippet:
                    [
                        'parents' => '2',
                        'element' => 'msProducts',
                        'ajax' => '1',
                        'frontend_js' => '/assets/components/pdotools/js/pdopage.custom.js',
                        'ajaxMode' => 'default',
                        'limit' => '12',
                        'includeTVs' => 'prokat,size,ostatok,nal,novinka,skidka',
                        'tvPrefix' => '',
                        'tpl' => 'slider',
                        'tplPageActive' => '@INLINE <li class="active"><span class="active-text">[[+pageNo]]</span></li>',
                    ]
                }
            </div>
        </div>
    </div>
</section>