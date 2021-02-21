[[!ChangePassword?
   &submitVar=`change-password`
   &placeholderPrefix=`cp.`
   &validateOldPassword=`1`
   &validate=`nospam:blank`
   &reloadOnSuccess=`0`
   &successMessage=`Ваш пароль успешно изменён`
]]


<div class="col-6">
    <p class="sd">Основные данные аккаунта</p>
    <div class="updprof-error">[[!+cp.error_message]]</div>
    <p>[[!+cp.successMessage]]</p>
    <div class="blo">
        <form class="form-horizontal" action="[[~[[*id]]]]" method="post">
        <div class="form-group">
            <label>Старый пароль *</label>
            <input type="password" name="password_old" id="password_old" value="[[+cp.password_old]]" class="form-control">
            <span class="help-block text-error">
                [[!+cp.error.password_old]]
            </span> 
        </div>
        <div class="form-group">
            <label>Новый пароль *</label>
            <input type="password" name="password_new" id="password_new" value="[[+cp.password_new]]" class="form-control">
            <span class="help-block text-error">
              [[!+cp.error.password_new]]
            </span>  
        </div>
        <div class="form-group">
            <label>Введите новый пароль ещё раз *</label>
            <input type="password" name="password_new_confirm" id="password_new_confirm" value="[[+cp.password_new_confirm]]" class="form-control">
            <span class="help-block text-error">
              [[!+cp.error.password_new_confirm]]
            </span> 
        </div>
        <hr>
        <input type="submit" value="Изменить пароль" name="change-password" id="change-password" class="btn btn-primary">
    </div>
</div>