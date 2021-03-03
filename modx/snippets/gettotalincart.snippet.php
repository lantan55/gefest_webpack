<?php
if (empty($_SERVER['HTTP_X_REQUESTED_WITH']) || $_SERVER['HTTP_X_REQUESTED_WITH'] != 'XMLHttpRequest') {return;}

if(!(isset($_REQUEST['cart']))) {return;}

$list = json_decode($_REQUEST['cart'], true);

if (empty($list)) {
    exit();
};

$miniShop2 = $modx->getService('miniShop2');
$miniShop2->initialize($modx->context->key);

$cart = $miniShop2->cart->get();

$output = array();
foreach ($cart as $cart_item) {
    if($cart_item['id'] == $list['id']) {
        $output = $cart_item;
    }
    
}
return json_encode($output);