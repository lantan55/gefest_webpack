<?php
$price = str_replace(',','.',$input);
$options = json_decode($modx->getOption('ms2_price_format'));
if (is_array($options)) {
    return number_format($price, $options[0], $options[1], $options[2]);
} else {
    return $price;
}