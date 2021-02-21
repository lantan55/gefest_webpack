<?php
$tpl = $modx->getOption('tpl',$scriptProperties,'tpl.order_row'); 
$tpl_empty = $modx->getOption('tpl',$scriptProperties,'tpl.order_row_empty');

$q = $modx->prepare("SELECT * FROM ".$modx->getOption('table_prefix')."ms2_order_products WHERE order_id=".$order);
$q->execute();
$results = $q->fetchAll(PDO::FETCH_ASSOC);

$output;

foreach ($results as $result) {
  $res = $modx->getObject('modResource', array('pagetitle'=>$result[name]));
  
  if ($res) {
    $resArray = $res->toArray();
    $output .= $modx->getChunk($tpl,$resArray);
  } else {
    $prodName = $modx->setPlaceholder('name', $result[name]);
    $output .= $modx->getChunk($tpl_empty);
  }
}
return $output;