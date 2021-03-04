<?php
$eventName = $modx->event->name;

switch($eventName) {
  case 'msOnBeforeAddToCart':
    // $modx->log(1, 'product '.print_r($product, true));
    // $modx->log(1, 'count '.print_r($count, true));
    // $modx->log(1, 'options '.print_r($options, true));
    // $modx->log(1, 'cart '.print_r($cart, true));
    break;
  case 'msOnAddToCart':   
  case 'msOnChangeInCart':
    $currentProduct = $_SESSION['minishop2']['cart'][$key]; 
    $productId = $currentProduct['id'];

    $product = $modx->getObject('msProduct', $productId);
    $options = $product->loadData()->get('options');
    $total = $options['vs_na_ostatke'][0];
    $newTotal = (int)$total - (int)$currentProduct['count'];
    
    if($newTotal >= 0){
      $currentProduct['total'] = $newTotal;
      
      // $modx->log(1, 'В сессии '.print_r($currentProduct, true));
    } else {
      // $currentProduct['total'] = 0;
      $modx->event->output('Вы пытаетесь добавить больше максимального веса');
      return;
    }
    
    
    break;
}
return;