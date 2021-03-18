<?php
switch ($modx->event->name) {
    case 'msOnEmptyCart': 
        $_SESSION['btn_list'] = array();
        break;
    case 'msOnRemoveFromCart':
        // $tmp = $cart->get();
        // $modx->log(1, print_r($tmp[$key], true));
        break;
        
        // $modx->log(1, print_r($cart, true));
}