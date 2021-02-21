<?php
if (empty($_SERVER['HTTP_X_REQUESTED_WITH']) || $_SERVER['HTTP_X_REQUESTED_WITH'] != 'XMLHttpRequest') {return;}

if(!(isset($_REQUEST['fav_list']))) {return;}

$list = json_decode($_REQUEST['fav_list']);

if (empty($list)) {
    exit();
};
$params = array(
    'element' => 'msProducts',
    'parents' => '0',
    'resources' => implode(",", $list),
    'tpl' => 'favorites_row',
    'limit' => '12',
    'tvPrefix' => ''

);

$output = $modx->runSnippet('pdoPage', $params);

return $output;