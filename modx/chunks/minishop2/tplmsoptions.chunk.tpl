{foreach $options as $name => $values}
    <div class="btn-group btn-group-toggle" data-toggle="buttons">
        {foreach $values as $k => $value}
            <label class="btn btn-outline-secondary product-option__toggle {if $k === 0 } active {/if}" for="option_{$value}">
                <input type="radio" name="options[]" id="option_{$value}" value="{$value}" autocomplete="off" {if $k === 0 } checked="checked" {/if}> {$value} мм
            </label>
        {/foreach}
    </div>
{/foreach}