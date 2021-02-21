<?php
switch($modx->event->name){
    case "OnWebPageInit":
        $modx->regClientScript('/assets/js/jquery.min.js"');      
        break;
}