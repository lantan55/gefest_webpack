<?php
$result = [];

// $input = json_decode($input);

foreach ($input as $key=>$value){ 
    if (empty(array_filter(array_values($value)))) {
        continue;
    } else {
        array_push($result, $value);
    }
}
// echo $input;
return json_encode($result, JSON_UNESCAPED_UNICODE);



// return $result;
			
// print_r($input);

// // echo $input;
// // echo $input;
// return $input;