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

                <!-- <div class="col-md-3 col-xxl-2">


                    {$_modx->getChunk('leftMenu')}


                </div> -->
                <div class="col-md-9  col-xxl-10">

                    <div class="row">
                        <div class="col-8">

                            <div class="map">
                                {'main_map' | config}
                            </div>
                        </div>
                        <div class="col-4">
                            <p>Почта: <br><a href="mailto:{'main_email' | config}">{'main_email' | config}</a></p>
                            <p>Адрес: <br>{'main_address' | config}</p>
                            <p>Время работы: <br>{'main_timeline' | config}</p>




                        </div>

                    </div>



                </div>




            </div>
        </main>
    </div>
{/block}
