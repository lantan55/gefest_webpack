<header class="header">
  <div class="container">
    <div class="header__row row justify-content-between">
      <div class="col-4 d-flex align-items-center justify-content-start">
        <a class="header__logo" href="{1 | url}">
          <img src="{'main_logo' | option}" alt="{'site_name' | option}" width="200" />
        </a>
      </div>
      <div class="header__cart col-4 d-flex align-items-center justify-content-end">{'!msMiniCart' | snippet}</div>
    </div>
    <div class="header__row row">
      <div class="col-12">
        <nav class="header__nav nav">
          <ul class="menu">
            <li><a href="/">Главная</a></li>
            <li><a href="/sale">Товары со скидкой</a></li>
            <li><a href="/new">Новые поступления</a></li>
            <li><a href="/dostavka">Доставка</a></li>
            <li><a href="/contacts">Контакты</a></li>
          </ul>
          <div class="megaSearch mr-2">
            {'!SimpleSearchForm' | snippet : [
              'landing' => 67              
            ]}
          </div>
        </nav>
      </div>
    </div>
  </div>
</header>
