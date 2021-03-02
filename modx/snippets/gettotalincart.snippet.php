<?php
if (empty($_SERVER['HTTP_X_REQUESTED_WITH']) || $_SERVER['HTTP_X_REQUESTED_WITH'] != 'XMLHttpRequest') {return;}

if(!(isset($_REQUEST['cart']))) {return;}

$list = json_decode($_REQUEST['cart'], true);

if (empty($list)) {
    exit();
};

$miniShop2 = $modx->getService('miniShop2');
$miniShop2->initialize($modx->context->key);

$cart = $miniShop2->cart->get(); // товары корзины

$modx->log(1, print_r($cart, true));
// $key = $list['total_key'];
// $modx->log(1, print_r($_SESSION['minishop2']['cart'], true));
$output = json_encode($cart);

return $output;