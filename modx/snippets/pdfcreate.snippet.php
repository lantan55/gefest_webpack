<?php
$date = date('Y-m-d_H-i-s', time()) . '_' .rand(1, 100);

$corePath = $modx->getOption('pdfresource.core_path', null, $modx->getOption('core_path') . 'components/pdfresource/');
$pdfresource = $modx->getService('pdfresource', 'PDFResource', $corePath . 'model/pdfresource/', array(
    'core_path' => $corePath
));

$content = $modx->getOption('content', $scriptProperties, '', true);
$title = $modx->getOption('title', $scriptProperties, '', true);
$author = $modx->getOption('author', $scriptProperties, '', true);

$aliasPath = MODX_ASSETS_PATH . 'pdf/';
$site_url = $modx->getOption('site_url');

// настройки PDFResource (подробнее почитать здесь: http://jako.github.io/PDFResource/usage/)
$pdfresource->initPDF(array(
    'mode' => 'utf-8',
    'format' => 'A4',
    'defaultFontSize' => intval(8),
    'defaultFont' => '',
    'mgl' => intval(10),    // margin left
    'mgr' => intval(10),    // margin right
    'mgt' => intval(7),     // margin top
    'mgb' => intval(7),     // margin bottom
    'mgh' => intval(10),    // margin header
    'mgf' => intval(10),    // margin footer
    'orientation' => 'P',   // ориентация PDF
    'customFonts' => '[]',
));

$pdfresource->pdf->SetTitle($title);
$pdfresource->pdf->SetAuthor($author);
$pdfresource->pdf->SetCreator($modx->getOption('site_url'));

$pdfresource->pdf->WriteHTML($content, 2);

$file_name = $date;
$pdfresource->pdf->Output($aliasPath . $file_name . '.pdf', 'F');
return $site_url . ltrim($modx->getOption('assets_url'), '/') . 'pdf/' .$file_name. '.pdf';