<div class="row">
    {if $.get.updpsuccess}
        <div class="col-12">
            <span class="success">
                Реквизиты заполнены, осталось загрузить подписанный договор
            </span>
        </div>
    {/if}
    <div class="col-12">
        <h2>Договор оферты</h2>
        <p>Для обеспечения сделки нам необходим скан договора оферты, подписанного с вашей стороны. Пожалуйста:</p>
        <ol>
            <li>Скачайте договор</li>
            <li>Распечатайте</li>
            <li>Поставьте подпись и печать(при наличии)</li>
            <li>Загрузите скан или фотографию подписанного договора(pdf или zip)</li>
        </ol>
    </div>
    <div class="col-12 mt-2">
        {'generateContract' | snippet}
    </div>
    <div class="col-12 mt-2">
        [[!UpdateProfile? 
            &postHooks=`hookProfileUpdateContract, hookProfileUpdateEmail`
            &excludeExtended=`file_contract`    
            &validate=`file_contract:required`
        ]]
        <form action="[[~[[*id]]]]" method="post" class="form form-horizontal validate" enctype="multipart/form-data">
            <input type="hidden" name="email" value="[[!+email]]" />
            <input type="hidden" name="fullname" value="{$_modx->user.fullname}" />
            <input type="hidden" name="id" value="[[!+modx.user.id]]" />    
            <div class="form-row mt-2">
                <label for="files" class="mb-1">Скан договора</label>
                <input type="file" name="file_contract" >
            </div>
            <div class="form-row mt-2">
                <button type="submit" class="btn btn-primary">Загрузить договор</button>
            </div>
        </form>
    </div>
</div>

