<?php
switch ($modx->event->name) {
    case 'msOnAddToCart':
        $tmp = $cart->get();
        $modx->log(1, print_r($tmp, true));
        // $modx->log(1, print_r($_SESSION['btn_list'], true));
        
        foreach ($tmp as $key1 => $value) {
            if ($product = $modx->getObject('msProduct', $value['id'])) {
                $quantity = $value['count']; 
                // $modx->log(1, print_r($quantity, true));    
                
                // if ($quantity > 499) {
                //     $tmp[$key1]['price'] = $product->get('price500');
                // }
                // elseif ($quantity > 99) {
                //     $tmp[$key1]['price'] = $product->get('price100');
                // }
                // elseif ($quantity > 49) {
                //     $tmp[$key1]['price'] = $product->get('price50');
                // }
                // elseif ($quantity > 9) {
                //     $tmp[$key1]['price'] = $product->get('price10');
                // }
                // elseif ($quantity > 4) {
                //     $tmp[$key1]['price'] = $product->get('price5');
                // }
                // else {
                //     $realPrice = $product->get('price1');
                //     $tmp[$key1]['price'] = $realPrice; // Устанавливаем новую цену для товара в корзине
                // }
            }
        }
        $cart->set($tmp);
}