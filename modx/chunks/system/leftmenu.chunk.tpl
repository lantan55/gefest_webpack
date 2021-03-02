<div class="lk_sidebar">
    {if $_modx->isMember('Users')}
        <div class="account">
            <span class="account__icon"></span>
            <h4 class="account__text">Неподтвержденный</h4>
        </div>
    {elseif $_modx->isMember('Подтвержденные')}
        <div class="account not">
            <span class="account__icon"></span>
            <h4 class="account__text">Подтвержденный</h4>
        </div>
    {/if}
    <div class="lk_sidebar__title">Личный кабинет</div>
    <ul class="lk_sidebar__list">
        {var $currUrl = $_modx->resource.id}
        <!--<li class="{$currUrl == 85 ? 'active' : ''}"><a href="{85 | url}">Мои заказы</a></li>-->
        <li class="{$currUrl == 37 ? 'active' : ''}"><a href="{37 | url}">Реквизиты</a></li>
        <li class="{$currUrl == 42 ? 'active' : ''}"><a href="{42 | url}">Изменить пароль</a></li>
        <li><a href="{41| url}/?service=logout" title="[[+actionMsg]]">Выход</a></li>
    </ul>
</div>
