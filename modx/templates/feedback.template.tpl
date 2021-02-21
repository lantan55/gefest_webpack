{extends 'template:main'}

{block 'main'}
    <div class="mainContent">
        <main class="container">
            <div class="row">
                <div class="col-md-9  col-xxl-10">
                    <div class="row">
                        <div class="col-12">
                            <h1>{'pagetitle' | resource}</h1>
                            {include 'crumbs'}
                        </div>
                        <div class="col-12 mt-4">
                            {'AjaxForm' | snippet : [
                                'snippet' =>  'FormIt',
                                'form' => 'feedback-form',
                                'hooks' => 'email',
                                'emailSubject' => 'Обратная связь',
                                'emailTo' => $_modx->config.emailsender,
                                'emailFrom' => $_modx->config.emailsender,
                                'validationErrorMessage' => 'В форме содержатся ошибки',
                                'validate' => 'name:required,message:required, phone:required',
                                'successMessage' => 'Сообщение успешно отправлено',
                                'emailTpl'=> 'email.feedback'
                            ]}
                        </div>
                    </div>
                    <div class="row mt-4">
                        {$_modx->resource.content}
                    </div>
                </div>
            </div>
        </main>
    </div>
{/block}