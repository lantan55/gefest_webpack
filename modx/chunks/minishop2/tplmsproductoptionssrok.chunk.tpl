{foreach $options as $option}
    <div class="product-option3__wrap">
        <div class="product-option3__title">
            {$option.caption}:    
        </div>
        <div class="product-option3__value">
            {if $option.value is array}
                {$option.value | join : ', '}
            {else}
                {$option.value}
            {/if}
        </div>    
    </div>
{/foreach}



