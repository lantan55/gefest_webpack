{extends 'template:main'}

{block 'main'}
    <div class="mainContent">
        <main class="container">
            <div class="row">
                <div class="pageTop">
                    <div class="col-md-12">
                        <h1>{$_modx->resource.pagetitle}</h1>
                        [[!Breadcrumbs? &homeCrumbTitle=`Гефест` &currentAsLink=`0`]]
                    </div>
                </div>
                <div class="col-md-12  col-xxl-12">
                    {$_modx->resource.content}
                </div>
            </div>
        </main>
    </div>
{/block}