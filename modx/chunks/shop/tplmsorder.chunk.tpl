<form class="ms2_form" id="msOrder" method="post">
  <input type="hidden" name="delivery" value="1" id="delivery_1">
  <div class="row">
    <hr class="mt-4 mb-4"/>
    <div class="col-12 row">
      <div class="col-12">
        <h4 class="mb-md-0">
          {'ms2_frontend_order_cost' | lexicon}: 
          <span id="ms2_order_cost">{$order.cost ?: 0}</span>
          {'ms2_frontend_currency' | lexicon}
        </h4>
      </div>
      <div class="form-group row input-parent">
        <label class="col-md-4 col-form-label" for="comment">
          {'ms2_frontend_comment' | lexicon} <span class="required-star">*</span>
        </label>
        <div class="col-md-8">
          <textarea name="comment" id="comment" placeholder="{'ms2_frontend_comment' | lexicon}"
            class="form-control{('comment' in list $errors) ? ' error' : ''}">{$form.comment}</textarea>
        </div>
      </div>
      <!-- <div class="col-12 mt-4">
        <div class="mb-3">
          <label for="comment" class="form-label">Комментарий к заказу</label>
          <textarea class="form-control" id="comment" name="comment" cols="2" rows="5"></textarea>
        </div>
      </div> -->
      <div class="col-12">
        <button type="submit" name="ms2_action" value="order/submit" class="btn btn-lg btn-primary ml-md-2 ms2_link">
          Отправить заказ
        </button>    
      </div>   
    </div>
  </div>
</form>