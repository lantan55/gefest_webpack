<?php
$emailFrom = $modx->getOption('emailsender');
$modx->getService('mail', 'mail.modPHPMailer');
$modx->mail->set(modMail::MAIL_FROM, $emailFrom);
$modx->mail->set(modMail::MAIL_FROM_NAME, $modx->getOption('site_name'));


$modx->mail->address('to', $emailTo);
$modx->mail->set(modMail::MAIL_SUBJECT, $subject);
$modx->mail->set(modMail::MAIL_BODY, $modx->getChunk($tpl, array( 'fullname' => $fullname)));
$modx->mail->setHTML(true);
if (!$modx->mail->send()) {
    $modx->log(modX::LOG_LEVEL_ERROR,'An error occurred while trying to send the email: '.$modx->mail->mailer->ErrorInfo);
}
$modx->mail->reset();