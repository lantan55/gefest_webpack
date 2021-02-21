<form class="ms2_form" id="msOrder" method="post">
    <input type="hidden" name="delivery" value="1" id="delivery_1">
    <div class="row">
        <hr class="mt-4 mb-4"/>
        <div class="col-12 d-flex flex-row">
            <h4 class="mb-md-0">{'ms2_frontend_order_cost' | lexicon}:</h4>
            <h3 class="mb-md-0 ml-md-2"><span id="ms2_order_cost">{$order.cost ?: 0}</span> {'ms2_frontend_currency' | lexicon}</h3>
    
            <button type="submit" name="ms2_action" value="order/submit" class="btn btn-lg btn-primary ml-md-2 ms2_link">
                {'ms2_frontend_order_submit' | lexicon}
            </button>    
        </div>
    </div>
</form>