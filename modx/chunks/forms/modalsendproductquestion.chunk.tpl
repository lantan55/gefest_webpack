<form action="" method="post" class="ajax_form af_example">
    <input type="hidden" name="id" value="{$_modx->user.id}"/>
    <input type="hidden" name="email" value="{$_modx->user.email}"/>
    <input type="hidden" name="fullname" value="{$_modx->user.fullname}"/>
    <h2>Напишите свой вопрос</h2>    
    <div class="form-group">
        <label class="control-label" for="sp_message">[[%af_label_message]]</label>
        <div class="controls">
            <textarea id="sp_message" name="message" class="form-control" rows="5">[[+fi.message]]</textarea>
            <span class="error_message">[[+fi.error.message]]</span>
        </div>
    </div>
    <div class="form-group">
        <div class="controls">
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