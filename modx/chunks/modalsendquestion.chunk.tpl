<form action="" method="post" class="ajax_form af_example">
    <h2>Задать вопрос</h2>
    
    <div class="form-group">
        <label class="control-label" for="af_companyname">[[%af_label_companyname]]</label>
        <div class="controls">
            <input type="text" id="af_companyname" name="companyname" value="[[+fi.companyname]]" placeholder="" class="form-control"/>
            <span class="error_companyname">[[+fi.error.companyname]]</span>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label" for="af_name">[[%af_label_name]]</label>
        <div class="controls">
            <input type="text" id="af_name" name="name" value="[[+fi.name]]" placeholder="" class="form-control"/>
            <span class="error_name">[[+fi.error.name]]</span>
        </div>
    </div>
    
    <div class="form-group">
        <label class="control-label" for="af_phone">[[%af_label_phone]]</label>
        <div class="controls">
            <input type="phone" id="af_phone" name="phone" value="[[+fi.phone]]" placeholder="" class="form-control mask-phone"/>
            <span class="error_phone">[[+fi.error.phone]]</span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label" for="af_message">[[%af_label_message]]</label>
        <div class="controls">
            <textarea id="af_message" name="message" class="form-control" rows="5">[[+fi.message]]</textarea>
            <span class="error_message">[[+fi.error.message]]</span>
        </div>
    </div>

    <div class="form-group">
        <div class="controls">
            <button type="reset" class="btn btn-default">[[%af_reset]]</button>
            <button type="submit" class="btn btn-primary">[[%af_submit]]</button>
        </div>
    </div>

    [[+fi.success:is=`1`:then=`
    <div class="alert alert-success">[[+fi.successMessage]]</div>
    `]]
    [[+fi.validation_error:is=`1`:then=`
    <div class="alert alert-danger">[[+fi.validation_error_message]]</div>
    `]]
</form>