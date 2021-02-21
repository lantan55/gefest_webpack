<?php
switch ($modx->event->name) {
    case "OnUserFormSave":
        $checkbox = $user->get('new_checkbox');
        
        if( $checkbox ) {
            if( !($user->isMember('Подтвержденные')) ) {
                $user->leaveGroup(2);
                $user->joinGroup(3);
                $user->save();
                $modx->runSnippet('sendEmail', array(
                    'tpl' => 'emailTplComfirmedUser',
                    'emailTo' => $user->get('email'),
                    'subject' => 'Ваши реквизиты подтверждены',
                    'fullname' => $user->get('fullname')
                ));     

            }
            
        } else {
            if( !($user->isMember('Users')) ) {
                $user->leaveGroup(3);
                $user->joinGroup(2);
                $user->save();    
                $modx->runSnippet('sendEmail', array(
                    'tpl' => 'emailTplFalseComfirmedUser',
                    'emailTo' => $user->get('email'),
                    'subject' => 'Ваши реквизиты не приняты',
                    'fullname' => $user->get('fullname')
                ));       
            }
        }
        break;
}