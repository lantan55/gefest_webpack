<?php
if (empty($_SERVER['HTTP_X_REQUESTED_WITH']) || $_SERVER['HTTP_X_REQUESTED_WITH'] != 'XMLHttpRequest') {return;}

if(!(isset($_REQUEST['total_count']))) {return;}

$list = json_decode($_REQUEST['total_count'], true);

if (empty($list)) {
    exit();
};
// $modx->log(1, print_r($list, true));
$output = $_SESSION['minishop2']['cart'][$list['key']['total']];


return $output;