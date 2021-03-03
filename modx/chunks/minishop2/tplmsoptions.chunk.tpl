{foreach $options as $name => $values}
    <div class="btn-group "  role="group">
        {foreach $values as $k => $value}
            <input type="checkbox"  class="btn-check" id="btncheck{$value}" value="{$value}" autocomplete="off">
            <label class="btn btn-outline-success" for="btncheck{$value}">{$value} кг</label>
            
            
        {/foreach}
    </div>
{/foreach}