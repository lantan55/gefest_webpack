<div class="carusel">
    <div class="container">
        <div class="row">
            {set $rows = json_decode($_modx->resource.infoblocks, true)}
            {foreach $rows as $row}
                <div class="col-md-12">
                    <div class="opt row {if $row.MIGX_id % 2 != 0 }flex-row-reverse{/if}">
                        <div class="col-md-6">
                            <img src="{$row.img}">
                        </div>
                        <div class="col-md-6">
                            <h4>{$row.title}</h4>
                            <p>{$row.text}</p>
                            <a href="{$row.href | url}">Подробнее...</a>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
</div>