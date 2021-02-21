<div class="filterBar">
    <div class="vibor col-sm-12">
        <div class="nameF">Фильтр</div>
        <div class="vib" style="display:none">Выбранные свойства</div>
        <div class="prokatV"></div>
        <div class="sizeV"></div>
    </div>
    <form class="form-horizontal" id="filters" action="">
        <input type="hidden" name="prokat">
        <input type="hidden" name="size">
        <div class="form-group">
            <label class="col-sm-12 control-label">Тип проката</label>
            <div class="col-sm-12" id="prokat">
                [[!filter? &tvname=`prokat` &id={$_modx->resource.id}]]
            </div>
            <label class="col-sm-12 control-label">Размер</label>
            <div class="col-sm-12" id="size">
                [[!filter? &tvname=`size` &id={$_modx->resource.id}]]
            </div>
        </div>
        <div class="col-md-12">
            <a href="#" id="clear">Очистить фильтр</a>
        </div>
    </form>
</div>