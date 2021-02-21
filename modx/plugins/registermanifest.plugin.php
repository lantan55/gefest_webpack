<?php
switch ($modx->event->name) {
    case "OnBeforeRegisterClientScripts":
        $manifest = MODX_ASSETS_PATH . 'manifest.json';
        if (file_exists($manifest)) {
            $files = json_decode(file_get_contents($manifest), true);
            foreach ($files as $file) {
                if (strpos($file, '.css')) {
                    $modx->regClientCSS($file);
                    // $modx->log(xPDO::LOG_LEVEL_ERROR, $file);
                } elseif (strpos($file, '.js')) {
                    $modx->regClientScript($file);
                }
            }
        }
};