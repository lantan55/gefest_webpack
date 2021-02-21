<?php
if($type == 'novinka'){
    
    $cities = $modx->runSnippet('pdoResources', array(
        'parents' => '0',
        'includeTVs' => $tvname.',novinka',
        'where' => ["novinka" => 1],
        'limit' =>0, 
        'tpl' =>'@INLINE [[+tv.'.$tvname.']]',
        'outputSeparator' => '--',
    ));
    
}elseif($type == 'skidka'){
    
    $cities = $modx->runSnippet('pdoResources', array(
        'parents' => '0',
        'includeTVs' => $tvname.',skidka',
        'where' => ["skidka" => 1],
        'limit' =>0, 
        'tpl' =>'@INLINE [[+tv.'.$tvname.']]',
        'outputSeparator' => '--',
    ));
    
}else{
    
    $cities = $modx->runSnippet('pdoResources', array(
        'parents'=> $id,
        'includeTVs'=> $tvname,
        'limit' =>0, 
        'tpl'=>'@INLINE [[+tv.'.$tvname.']]',
        'outputSeparator' => '--'
    ));
    
}

$cities = explode('--', $cities);
//print_r($cities);
$cities = array_unique($cities);
natsort($cities);

foreach($cities as $k => $city){
    if($city != ''){
        $out .= '<button data-name="'.$city.'">'.$city.'</button>';
    }
}
return $out;