<div id="msMiniCart" class="{$total_count > 0 ? 'full' : ''}">
    <div class="d-flex align-items-center align-content-stretch">
        <div class="header__account">
            {if $_modx->isAuthenticated()}
                <a class="header__login active " href="{41 | url}">
                    <span class="header__icon header__icon--account"></span>
                    {$_modx->user.fullname}
                </a>
            {else}
                <a class="header__login" href="{41 | url}">
                    <span class="header__icon header__icon--account"></span>
                    Войти
                </a>
            {/if}
            <a class="header__fav " href="/favorite">
                <span class="header__icon header__icon--fav"></span>
                <span class="header__label" id="favCount">0</span>
            </a>
            <a class="header__cart" href="/cart">
                <span class="header__icon header__icon--cart"></span>
                <span class="header__label ms2_total_count">{$total_count}</span>
            </a>
        </div>
    </div>
</div>