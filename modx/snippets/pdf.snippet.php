<?php
$pdo = $modx->getService('pdoFetch'); 
$pdfTpl = $modx->getOption('pdfTpl', $formit->config, '', true);
$author = $modx->getOption('author', $formit->config, 'Автор', true);
$title = $modx->getOption('title', $formit->config, 'Заголовок PDF', true);
$content = $pdo->getChunk($pdfTpl, $fields);

$config = array();
$config = array_merge($config, $fields, array(
    'content' => $content,
    'author' => $author,
    'title' => $title,
));
// формируем ссылку на PDF
$hook->setValue('pdf_link', $modx->runSnippet('PdfCreate', $config)); 

return true;