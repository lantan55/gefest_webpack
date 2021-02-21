<div class="home-slider owl-carousel owl-theme" id="main">
    {set $rows = json_decode($_modx->resource.main_slider, true)}
    {foreach $rows as $row}
        <div class="slide">
            <div class="slide__wrap">
                <h2 class="slide__title">{$row.title}</h2>
                <h4 class="slide__subtitle">{$row.subtitle}</h4>
                {if $row.button}
                    <a  href="{$row.link | url}" class="btn btn-primary slide__btn">{$row.button}</a>
                {/if}
            </div>
            <div class="slide__img">
                <img src="{$row.bg}" alt="">
            </div>
        </div>
    {/foreach}
</div>