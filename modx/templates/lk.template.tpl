{extends 'template:main'}

{block 'main'}
    <div class="mainContent">
        <main class="container">
            <div class="row">
                {if $_modx->isAuthenticated()}
                    <div class="col-md-3 col-xxl-2">
                        {include 'LkMenu'}
                    </div>
                {/if}
                <div class="col-md-9  col-xxl-10">
                    <div class="row">
                        <div class="col-12">
                            <h1>{'pagetitle' | resource}</h1>
                            {include 'crumbs'}
                        </div>
                    </div>
                    <div class="row mt-4">
                        {$_modx->resource.content}
                    </div>
                </div>
            </div>
        </main>
    </div>
{/block}