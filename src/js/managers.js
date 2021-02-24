let indexManagers = 0;
function getFormManagers(index) {
  return `
 	        <div class="j-manager-card mt-4">
                <div class="form-row">
                    <div class="col-12">
                        <h4>${index}. Сотрудник</h4>
                    </div>
                    <div class="col-12">
                        <h5>ФИО</h5>
                    </div>
                    <div class="col-12">
                        <div class="form-group position-relative">
                            <input type="text"
                                class="form-control "
                                id="" placeholder="Введите полное наименование компании"
                                name="Менеджмент[сотрудник${index}][фио]"
                                value=""
                            />
                        </div>
                    </div>
                    <div class="col-12">
                        <h5>Email</h5>
                    </div>
                    <div class="col-12">
                        <div class="form-group position-relative">
                            <input type="email"
                                class="form-control input__email"
                                placeholder="Введите полное наименование компании"
                                name="Менеджмент[сотрудник${index}][email]"
                                value=""
                            />
                        </div>
                    </div>
                    <div class="col-12">
                        <h5>Телефон</h5>
                    </div>
                    <div class="col-12">
                        <div class="form-group position-relative">
                            <input type="text"
                                class="form-control j-with-hidden mask-phone"
                                id="" placeholder="Введите полное наименование компании"
                                name="Менеджмент[сотрудник${index}][телефон]"
                                value=""
                            />
                        </div>
                    </div>
                </div>
            </div>
        `;
}

function printManagers() {
  indexManagers++;
  $(".j-managers").append(getFormManagers(indexManagers));
}

printManagers();
$(document).on("click touchend", ".j-addNew", function (e) {
  e.preventDefault();
  printManagers();
});
