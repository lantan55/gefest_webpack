<table class="table table-bordered">
    <tbody>
        {foreach $options as $option}
            <tr>
                <td>
                    {$option.caption}:
                </td>
                <td>
                    {if $option.value is array}
                        {$option.value | join : ', '}
                    {else}
                        {$option.value}
                    {/if}
                </td>
            </tr>
        {/foreach}        
    </tbody>
</table>