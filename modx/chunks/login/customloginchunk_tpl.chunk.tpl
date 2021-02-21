{include 'customRegisterChunk'}
<div class="col-6">
    <div class="cover">
        <h3>Авторизация</h3>
        <div class="loginMessage">[[+errors]]</div>
        <form class="loginLoginForm" action="[[~[[*id]]]]" method="post">
            <legend class="loginLegend">[[+actionMsg]]</legend>
            <div class="form-group">
                <label>Ваш email *</label>
                <input class="form-control" type="email" name="username" placeholder="Введите email" required="" />
                
            </div>
            <div class="form-group">
                <label>Пароль *</label>
                <input class="form-control" type="password" name="password" placeholder="Введите пароль" required="" />
            </div>
            <input class="loginLoginValue" type="hidden" name="service" value="login" />
             <hr>
             <input type="submit" class="btn btn-primary" name="Login" value="[[+actionMsg]]" />
        </form>
        <span><a href="{44 | url}">Забыли пароль?</a></span>
    </div>    
</div>