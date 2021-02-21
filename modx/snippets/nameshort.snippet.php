<?php
$arr = explode(" ", $input);
$surname = $arr[0];
$name = substr($arr[1], 0, 2) . '.';
$pat = substr($arr[2], 0, 2) . '.';
$result = array($surname, $name, $pat);

return implode(' ', $result);