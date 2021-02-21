{extends 'template:main'}

{block 'main'}
    <div class="mainContent">
        <main class="container">
            <div class="row">
                <div class="pageTop">
                    <div class="col-md-12">
                        <h1>{$_modx->resource.pagetitle}</h1>
                        [[!Breadcrumbs? &homeCrumbTitle=`Гефест` &currentAsLink=`0`]]
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    {$_modx->resource.content}
                </div>
                <div class="col-12 col-md-6">
                    {'AjaxForm' | snippet : [
                        'snippet' =>  'FormIt',
                        'form' => 'form.sendSupplier',
                        'hooks' => 'email',
                        'emailSubject' => 'Форма Стать поставщиком',
                        'emailTo' => $_modx->config.emailsender,
                        'emailFrom' => $_modx->config.emailsender,
                        'validationErrorMessage' => 'В форме содержатся ошибки',
                        'validate' => 'companyname:required,name:required,email:required,phone:required,message:required',
                        'successMessage' => 'Сообщение успешно отправлено',
                        'emailTpl'=> 'email.sendSupplier'
                    ]}
                </div>
            </div>
        </main>
    </div>
{/block}