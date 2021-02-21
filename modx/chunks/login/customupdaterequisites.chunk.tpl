
[[!+login.update_success:is=`1`:then=`
    <div class="col-12"><span class="success">Спасибо! Ваши данные отправлены на проверку менеджеру.</span></div>
`]]

<div class="col-12">
    <button style="position: fixed; top: 20px; right: 20px;" class="btn btn-primary" id="appendTestReq" role='button'>Заполнить реквизиты</button>
</div>

{if $_modx->user.extended}
    {'requisites_table' | chunk}
{else}
    {'requisites_form' | chunk}
{/if}
