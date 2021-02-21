[[!UpdateProfile? &validate=`fullname:required`]]
<div class="col-6">
    <p class="sd">Основные данные аккаунта</p>
    <div class="updprof-error">[[+error.message]]</div>
    [[+login.update_success:is=`1`:then=`[[%login.profile_updated? &namespace=`login` &topic=`updateprofile`]]`]]
    <div class="blo">
        <form action="[[~[[*id]]]]" method="post" class="form-horizontal">
            <input type="hidden" name="nospam" value="">
            <div class="form-group">
                <label>Ваше имя *</label>
                <input type="text" name="fullname" class="form-control" id="fullname" value="[[+fullname]]">
                <span class="help-block text-error">
                  [[+error.fullname]]
                </span> 
            </div>
            <div class="form-group">
                <label>Ваш email *</label>
                <input type="email" name="email" class="form-control" id="email" value="[[+email]]">
                <input type="hidden" name="username" class="form-control" id="username" value="[[+email]]">
                <span class="help-block text-error">
                  [[+error.fullname]]
                </span> 
            </div>
            <hr>
            <button type="submit"  class="btn btn-primary">Сохранить</button>
        </form>
    </div>
</div>