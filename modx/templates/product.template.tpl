{extends 'template:main'}

{block 'main'}
    <div class="mainContent">
        <main class="container">
            <div class="row">
                <div class="pageTop">
                    <div class="col-md-12">
                        {'Breadcrumbs' | snippet : [
                        'homeCrumbTitle' => 'Гефест',
                        'currentAsLink' => '0'
                        ]}
                    </div>
                </div>
                <div class="col-md-12">
                    <div id="content" class="product">
                        {$_modx->getChunk('msProduct.content')}
                    </div>
                </div>
            </div>
        </main>
    </div>
{/block}