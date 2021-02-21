<?php
// $mailTo = 'a@saytspb.ru';
$mailTo = 'gef.online@yandex.ru';

$fields = array(
    'username' => $hook->getValue('fullname'),
    'id' => $hook->getValue('id')
);

// $modx->log(1, print_r($fields, 1));
$message = $modx->getChunk('email.sendReq', $fields);

$modx->getService('mail', 'mail.modPHPMailer');
$modx->mail->set(modMail::MAIL_BODY,$message);
$modx->mail->set(modMail::MAIL_FROM,$modx->config['emailsender']);
$modx->mail->set(modMail::MAIL_FROM_NAME,$modx->config['site_name']);
$modx->mail->set(modMail::MAIL_SENDER, $modx->config['emailsender']);
$modx->mail->set(modMail::MAIL_SUBJECT,'Отправлены реквизиты на проверку');
$modx->mail->address('to', $mailTo);
$modx->mail->setHTML(true);
if (!$modx->mail->send()) {
    $modx->log(modX::LOG_LEVEL_ERROR,'An error occurred while trying to send the email: '.$modx->mail->mailer->ErrorInfo);
}
$modx->mail->reset();
return true;