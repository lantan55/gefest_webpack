<?php
// $value = (float)$value;
$success = strpos($value, "_");
if ($success) {
    // Note how we can add an error to the field here.
    $validator->addError($key,'Заполните поле полностью!');
}
// return true;