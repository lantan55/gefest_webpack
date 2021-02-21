<div class="col-12">
    <div class="row">
        <div class="col-12">
            Заказ <span>[[+num]]</span> от <span>[[+createdon]]</span> года
        </div>
        [[!msOrdersProducts?
            &order=`[[+id]]`
            &tpl=`tpl.order_row`
            &tpl_empty=`tpl.order_row_empty`
        ]]
    </div>    
</div>
