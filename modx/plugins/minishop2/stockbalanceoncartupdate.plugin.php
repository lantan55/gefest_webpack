<?php
$eventName = $modx->event->name;

switch($eventName) {
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
    } else {
      // $currentProduct['total'] = 0;
      $modx->event->output('Вы пытаетесь добавить больше максимального веса');
      return;
    }
    
    
    break;
}
return;