<form action="[[~[[*id]]]]" method="post" class="form form-horizontal ">
  <div class="form-row ">
      <div class="col-6 form__block p-4">
        <div class="form-group mb-0 position-relative">
          <label>Имя</label>
          <input
            type="text"
            class="form-control input__text"
            id="name"
            placeholder="Введите ваше имя *"
            name="name"
            value=""
          />
        </div>
        <div class="form-group mb-0 position-relative">
          <label>Номер телефона</label>
          <input
            type="text"
            class="form-control input__text mask-phone"
            id="phone"
            placeholder="Введите номер телефона *"
            name="phone"
            value=""
          />
          
        </div>
        <div class="form-group mb-0 position-relative">
          <label>Сообщение</label>
          <textarea
            class="form-control "
            id="message"
            placeholder="Введите ваше сообщение *"
            name="message"
            value=""
            rows="6"
          ></textarea>
        </div>
      </div>
  </div>
  
  <div class="form-row">
    <div class="col-6 d-flex  justify-content-center">
      <button type="submit"   class="btn btn-primary j-sendRQform">Сохранить данные</button>
    </div>
  </div>
</form>