


<div class="ms2_product j-item col-4">
    <form method="post" class="ms2_form">
        <input type="hidden" name="id" value="{$id}">
        <input type="hidden" name="count" value="1">
        <input type="hidden" name="options" value="[]">
        <div class="title">
            <span class="toFav"></span>

            {if $thumb?}
                <a href="{$id | url}" class="im">
                    <img src="{$thumb}" class="mw-100" alt="{$pagetitle}" title="{$pagetitle}"/>
                </a>
            {else}
                <a href="{$id | url}" class="empty">
                    <img src="/assets/img/non.jpg" class="mw-100" alt="{$pagetitle}" title="{$pagetitle}"/>
                </a>
            {/if}

        </div>
        <div class="msbody">
            <div class="msg">
                <div class="msgc">
                    <div class="prices">
                        {if $old_price?}
                            <span class="old_price ml-md-3">{$old_price} {'ms2_frontend_currency' | lexicon}</span>
                        {/if}
                        <span class="price ml-md-3">{$price} {'ms2_frontend_currency' | lexicon}</span>
                    </div>
                    <a href="{$id | url}" class="font-weight-bold">{$pagetitle}</a>
                    <div class="ost">
                        {if $ostatok?}
                            <span class="ostatok ml-md-3">Остаток: {$ostatok} кг.</span>
                        {/if}
                        {if $nal == 1}
                            <span class="nal nalgreen ml-md-3">В наличии</span>
                        {else}
                            <span class="nal nalred ml-md-3">Нет в наличии</span>
                        {/if}

                    </div>
                </div>
                <div class="msd">
                    {if $old_price?}
                        <!--<div><span class="badge badge-secondary badge-pill skid">-[[!skidka? &price=`{$price}` &old_price=`{$old_price}`]] %</span></div>-->
                    {/if}
                    {if $novinka?}
                        <div><span class="badge badge-secondary badge-pill new">{'ms2_frontend_new' | lexicon}</span></div>
                    {/if}
                    {if $popular?}
                        <div><span class="badge badge-secondary badge-pill pop">{'ms2_frontend_popular' | lexicon}</span></div>
                    {/if}
                    {if $favorite?}
                        <div><span class="badge badge-secondary badge-pill fav">{'ms2_frontend_favorite' | lexicon}</span></div>
                    {/if}
                </div>
                {if $introtext}
                    <div class="mt-2 text-center text-md-left">
                        <small>{$introtext | truncate : 200}</small>
                    </div>
                {/if}
            </div>
            <div class="mscart">
                <a class="btn btn-primary"  href="{$id | url}">подробнее</a>
            </div>
        </div>
    </form>
</div>