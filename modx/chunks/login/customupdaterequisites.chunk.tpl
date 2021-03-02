<div class="col-12">
    <button style="position: fixed; top: 20px; right: 20px;" class="btn btn-primary" id="appendTestReq" role='button'>Заполнить реквизиты</button>
</div>

{if $_modx->user.extended}
    {if $_modx->user.user_contract}
        {'requisites_table' | chunk}
    {else}
        {'requisites_contract' | chunk}
    {/if}
{else}
    {'requisites_form' | chunk}
{/if}
