<?php
if (empty($_SERVER['HTTP_X_REQUESTED_WITH']) || $_SERVER['HTTP_X_REQUESTED_WITH'] != 'XMLHttpRequest') {return;}

if(!(isset($_REQUEST['cart']))) {return;}

$list = json_decode($_REQUEST['cart'], true);

if (empty($list)) {
    exit();
};

$miniShop2 = $modx->getService('miniShop2');
$miniShop2->initialize($modx->context->key);


$_SESSION['btn_list'] = $list['btn_list'];
// $modx->log(1, 'список кнопкок '. print_r($_SESSION['btn_list'], true));


$cart = $miniShop2->cart->get();

$output = array();
foreach ($cart as $k=>$cart_item) {
    if($cart_item['id'] == $list['id']) {
        $cart_item['key'] = $k;
        $output = $cart_item;
    }
    
}
return json_encode($output);