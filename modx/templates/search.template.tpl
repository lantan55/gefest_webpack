{extends 'template:main'}

{block 'main'}
    <div class="mainContent">
        <main class="container">
            <div class="row">
                <div class="pageTop">
                    <div class="col-md-12"></div>
                </div>
                <div class="col-md-12">
                    <div class="row">
                        {$_modx->resource.content}
                    </div>
                </div>
            </div>
        </main>
    </div>
{/block}