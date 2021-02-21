<div class="home-subcategory">
    <div class="container">
        <div class="row">
            {set $rows = json_decode($_modx->resource.subcat_list, true)}
            {foreach $rows as $row}
                <div class="col-md-3">
                    <div class="home-subcategory__item">
                        <a href="{$row.list | url}" >{$row.header}</a>
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
</div>