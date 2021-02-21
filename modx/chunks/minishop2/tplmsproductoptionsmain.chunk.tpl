{foreach $options as $option}
    <div class="row product-options">
        <div class="col-6">
            <div class="product-options__title">
                {$option.caption}:
            </div>
        </div>
        <div class="col-6">
            <div class="product-options__value">
                {if $option.value is array}
                    {$option.value | join : ', '}
                {else}
                    {$option.value}
                {/if}
            </div>
        </div>
    </div>
{/foreach}

