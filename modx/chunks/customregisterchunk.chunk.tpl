[[!Register?
  &submitVar=`login-register-btn`
  &activation=`1`
  &activationEmailSubject=`Подтверждение регистрации`
  &activationResourceId=`39`
  &successMsg=`Спасибо за регистрацию. На вашу электронную почту <span class="font-weight-bold">[[!+reg.email]]</span> отправлено письмо, содержащее ссылку, необходимую для активации аккаунта. Перейдите по ссылке в письме, чтобы завершить процедуру регистрации.`
  &usergroups=`Users`
  &usernameField=`email`
  &passwordField=`password`
  &validate=`nospam:blank,
    password:required:minLength=^8^,
    password_confirm:password_confirm=^password^,
    fullname:required,
    email:required:email,
    check_politics:required`
  &placeholderPrefix=`reg.`
  &excludeExtended=`check_subscribe,check_politics`

]]

<div class="col-6">
    <div class="cover">
        [[!+error.message:eq=``:then=`
            <form class="form" action="[[~[[*id]]]]" method="post">
                <h3>Регистрация</h3>
                <div class="form-group">
                    <label>Ваше имя *</label>
                    <input type="text" name="fullname" class="form-control" value="[[!+reg.fullname]]" placeholder="Введите имя" >
                    [[!+reg.error.fullname]]
                </div>
                <div class="form-group">
                    <label>Ваш email *</label>
                    <input type="email" name="email" class="form-control" value="[[!+reg.email]]" placeholder="Введите email" >
                    [[!+reg.error.email]]
                </div>
                <div class="form-group">
                    <label>Придумайте пароль: *</label>
                    <input type="password" name="password" class="form-control" value="[[!+reg.password]]" placeholder="Введите пароль" >
                    [[!+reg.error.password]]
                </div>
                <div class="form-group">
                    <label>Введите пароль ещё раз: *</label>
                    <input type="password" name="password_confirm" class="form-control" value="[[!+reg.password_confirm]]" placeholder="Введите пароль еще раз" >
                    [[!+reg.error.password_confirm]]
                </div>
                <div class="form-group mt-2">
                    <label>
                        <input type="checkbox" name="check_politics" />    
                        Регистрируясь на {'site_name' | option}, я соглашаюсь с <a href="{'71' | url}">Политикой обработки персональных данных</a> и даю свое согласие на обработку моих персональных данных
                    </label>
                    [[!+reg.error.check_politics:notempty=`<span class="error">Вы должны согласиться с политикой нашего сайта</span>`]]
                </div>
                <div class="form-group mt-2">
                    <label>
                        <input type="checkbox" name="check_subscribe" checked="checked"/>    
                        Я хочу получать новости {'site_name' | option} на Email и лучшие акции от моих любимых магазинов
                    </label>
                </div>
                <hr>
                <input type="submit" name="login-register-btn" class="btn btn-primary" value="Отправить">
            </form>
        `:else=`[[!+error.message]]`]]
    </div>
</div>
