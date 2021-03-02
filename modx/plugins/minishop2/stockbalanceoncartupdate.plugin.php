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
    
    if($newTotal > 0){
      $modx->log(1, 'Мы сюда вообще попадаем? '.print_r($currentProduct['total'], true));
      $currentProduct['total'] = $newTotal;      
    } else {
      $currentProduct['total'] = 0;
      $modx->event->output('Вы пытаетесь добавить больше максимального веса');
      return;
    }
    $modx->log(1, print_r($_SESSION['minishop2']['cart'][$key], true));
    $modx->log(1, 'newtotal - '.print_r($newTotal, true));
    
    // $modx->log(1, 'Остаток в базе: '.print_r($total, 1));
    // $modx->log(1, 'Остаток в сессии: '.print_r($currentProduct['total'], 1));
    // $modx->log(1, 'Количество в корзине: '.print_r($currentProduct['count'], 1));
    // $modx->log(1, 'Количество в корзине: '.print_r($currentProduct, 1));
    break;
}
return;