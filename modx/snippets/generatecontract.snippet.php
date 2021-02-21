<?php
$user = $modx->getUser();
$test = $user->get('username');
$profile = $user->Profile;
$customer = $profile->get('extended');
if($profile->get('user_contract')) return;

if(isset($customer)){
    $date = date('Y-m-d_H-i-s', time()) . '_' .rand(1, 100);
    $corePath = $modx->getOption('pdfresource.core_path', null,  $modx->getOption('core_path') . 'components/pdfresource/');
    $pdfresource = $modx->getService('pdfresource', 'PDFResource', $corePath . 'model/pdfresource/', array(
        'core_path' => $corePath
    ));

    $pdoTools = $modx->getService('pdoTools'); 
    $seller = array(
        'req_name' => $modx->getOption('req_name',''),
        'req_name_full' => $modx->getOption('req_name_full',''),
        'req_phone' => $modx->getOption('req_phone',''),
        'req_address' => $modx->getOption('req_address',''),
        'req_inn' => $modx->getOption('req_inn',''),
        'req_kpp' => $modx->getOption('req_kpp',''),
        'req_ogrn' => $modx->getOption('req_ogrn',''),
        'req_okpo' => $modx->getOption('req_okpo',''),
        'req_bank_name' => $modx->getOption('req_bank_name',''),
        'req_bank_address' => $modx->getOption('req_bank_address',''),
        'req_bik' => $modx->getOption('req_bik',''),
        'req_rs' => $modx->getOption('req_rs',''),
        'req_ks' => $modx->getOption('req_ks',''),
        'req_dir_name' => $modx->getOption('req_dir_name',''),
        'req_buh_name' => $modx->getOption('req_buh_name',''),
        'req_print' => $modx->getOption('req_print',''),
        'req_sign' => $modx->getOption('req_sign',''),
    );

    $contract_id = 1;
    $currentDate = date("d.m.y");
    $content = $pdoTools->getChunk('tpl.PDF_contract', array(        
        'seller' => $seller,
        'customer' => $customer,
        'contract_id' => $contract_id,
        'current_date' => $currentDate
    ));
    

    $footer = $pdoTools->getChunk('tpl.PDF_contract.footer', array(        
        'seller' => $seller["req_dir_name"],
        'customer' => $customer["Руководство"]["директор"]["фио"]
    ));
        
    $title ='Договор';
    $author = 'Artem Avakyan';
    $aliasPath = MODX_ASSETS_PATH . 'pdf/';
    $pdfresource->initPDF(array(
        'mode' => 'utf-8',
        'format' => 'A4',
        'defaultFontSize' => intval(8),
        'defaultFont' => '',
        'mgl' => intval(10),    // margin left
        'mgr' => intval(10),    // margin right
        'mgt' => intval(7),     // margin top
        'mgb' => intval(20),     // margin bottom
        'mgh' => intval(10),    // margin header
        'mgf' => intval(5),    // margin footer
        'orientation' => 'P',   // ориентация PDF
        'customFonts' => '[]',
    ));
    
    $pdfresource->pdf->SetTitle($title);
    $pdfresource->pdf->SetAuthor($author);
    $pdfresource->pdf->SetCreator('test');
    $pdfresource->pdf->SetHTMLFooter($footer);
    $pdfresource->pdf->WriteHTML($content, 2);
    
    
    $tmp_path = MODX_ASSETS_PATH . 'pdf/';
    $file_name = 'Договор №' . $contract_id. ' от ' . $currentDate . '.pdf';
    $file_path = MODX_ASSETS_PATH . 'uploads/' . $user->get('id') . '/';
    $web_path = 'assets/uploads/' . $user->get('id') . '/' . $file_name;
    
    $pdfresource->pdf->Output($tmp_path . $file_name, 'F');
    
    if(!file_exists($file_path)){
        mkdir($file_path);    
    }
    $path1 = $tmp_path . $file_name;
    $path2 = $file_path . $file_name;
    
    
    if (copy($path1, $path2)) {        
        return "<a class='btn btn-secondary' href='$web_path' download>Скачать договор</a>";
        
    } else {
        return "Не удалось сформировать договор. Обратитесь к администратору";
    }

}else {

}