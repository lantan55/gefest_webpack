<div style="display:none;" id="sendForm">
    {'AjaxForm' | snippet : [
        'snippet' =>  'FormIt',
        'form' => 'modal.sendForm',
        'hooks' => 'email',
        'emailSubject' => 'Запрос товара',
        'emailTo' => $_modx->config.emailsender,
        'emailFrom' => $_modx->config.emailsender,
        'validationErrorMessage' => 'В форме содержатся ошибки',
        'validate' => 'companyname:required,name:required,email:required,message:required, phone:required',
        'successMessage' => 'Сообщение успешно отправлено',
        'emailTpl'=> 'email.sendRequest'
    ]}
    
</div>
<div style="display:none;" id="sendQuestion">
    {'AjaxForm' | snippet : [
        'snippet' =>  'FormIt',
        'form' => 'modal.sendQuestion',
        'hooks' => 'email',
        'emailSubject' => 'Задать вопрос',
        'emailTo' => $_modx->config.emailsender,
        'emailFrom' => $_modx->config.emailsender,
        'validationErrorMessage' => 'В форме содержатся ошибки',
        'validate' => 'companyname:required,name:required,message:required, phone:required',
        'successMessage' => 'Сообщение успешно отправлено',
        'emailTpl'=> 'email.sendRequest'
    ]}
</div>
<div style="display:none;" id="sendProductQuestion">
    {'AjaxForm' | snippet : [
        'snippet' =>  'FormIt',
        'form' => 'modal.sendProductQuestion',
        'hooks' => 'email',
        'emailSubject' => 'Вопрос по продукту',
        'emailTo' => $_modx->config.emailsender,
        'emailFrom' => $_modx->config.emailsender,
        'validationErrorMessage' => 'В форме содержатся ошибки',
        'validate' => 'fullname:required,message:required',
        'successMessage' => 'Сообщение успешно отправлено',
        'emailTpl'=> 'email.sendProductQuestion'
    ]}
</div>