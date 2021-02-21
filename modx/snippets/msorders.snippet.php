<?php
$user_id = $modx->user->get('id');
$tpl = $modx->getOption('tpl', $scriptProperties, 'tpl.order');

$q = $modx->newQuery('msOrder', array('user_id' => $user_id));
$results = $modx->getCollection('msOrder', $q);


if(!(empty($results))){
    foreach ($results as $result) {
        $resultArray = $result->toArray();
        $modx->log(1, print_r($resultArray));
        $output .= $modx->getChunk($tpl,$resultArray);
    }   
} else {
    $output = 'У вас пока еще нет заказов.';
}
 
return $output;