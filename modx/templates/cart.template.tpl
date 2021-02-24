{extends 'template:main'}

{block 'main'}
  <div class="mainContent">
    <main class="container">
      <div class="row">
        <div class="pageTop">
          <div class="col-md-12"></div>
        </div>
        {if $_modx->isAuthenticated()}
          <div class="col-md-3 col-xxl-2">
            {include 'LkMenu'}
          </div>
        {/if}
          <div class="col-md-9  col-xxl-10">
            <div class="row">
              <div class="col-12">
                <h1>{$_modx->resource.pagetitle}</h1>
                {include 'crumbs'}
              </div>
            </div>
            <div class="row">
              <div class="col-12 mt-4">
                {'!msCart' | snippet}
              </div>
            </div>
            <div class="row">
              <div class="col-12 mt-4">
                {'!msOrder' | snippet}
              </div>
            </div>
            <div class="row">
              <div class="col-12 mt-4">
                {'!msGetOrder' | snippet}
              </div>
            </div>
          </div>
        </div>
    </main>
  </div>
{/block}