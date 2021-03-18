<?php
$user = $modx->getUser();
$test = $user->get('username');
$profile = $user->Profile;
$customer = $profile->get('extended');
// if($profile->get('user_contract')) return;

function nameShort($input){
    $arr = explode(" ", $input);
    $surname = $arr[0];
    $name = substr($arr[1], 0, 2) . '.';
    $pat = substr($arr[2], 0, 2) . '.';
    $result = array($surname, $name, $pat);
    
    return implode(' ', $result);
}

if(isset($customer)){
    
    
    
    
    // $phpWord = new \PhpOffice\PhpWord\PhpWord();
    $contract_path = $_SERVER['DOCUMENT_ROOT'] . $modx->getOption('contract_tpl');
    $key = 'contract_number';
    $last_number = (int)$modx->getOption($key);
    $setting = $modx->getObject('modSystemSetting', array('key' => $key));
    $modx->log(modX::LOG_LEVEL_ERROR, 'key ' . $last_number );
    $last_number++;
    if ($setting) {
        $setting->set('value', $last_number);
        $setting->save();
        $modx->cacheManager->refresh(array('system_settings' => array()));
    } else {
        $modx->log(modX::LOG_LEVEL_ERROR, 'No setting with key ' . $key . ' found');
    }
    $new_number  = (int)$modx->getOption($key);
    
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
    
    
    $templateProcessor = new \PhpOffice\PhpWord\TemplateProcessor(MODX_ASSETS_PATH. 'Template.docx');
    
    
    $templateProcessor->setValue('dogovor_number', $new_number);
    $templateProcessor->setValue('dogovor_date', date("d.m.Y"));
    
    $templateProcessor->setValue('seller_name',  $seller['req_name']);
    $templateProcessor->setValue('seller_fullname', $seller['req_name_full']);
    $templateProcessor->setValue('seller_dir_name', nameShort( $seller['req_dir_name'] ) );
    $templateProcessor->setValue('seller_address', $seller['req_address']);
    $templateProcessor->setValue('seller_inn', $seller['req_inn']);
    $templateProcessor->setValue('seller_kpp', $seller['req_kpp']);
    $templateProcessor->setValue('seller_rs', $seller['req_rs']);
    $templateProcessor->setValue('seller_bank_address', $seller['req_bank_address']);
    $templateProcessor->setValue('seller_bank_bik', $seller['req_bik']);
    $templateProcessor->setValue('seller_bank_ks', $seller['req_ks']);
    $templateProcessor->setValue('seller_phone', $seller['req_phone']);

    
    $templateProcessor->setValue('customer_name', $customer["Реквизиты"]["название"]);
    $templateProcessor->setValue('customer_fullname', $customer["Реквизиты"]["полное_наименование"]);
    $templateProcessor->setValue('customer_address', $customer["Адреса"]["юридический"]["индекс"] . ', ' . $customer["Адреса"]["юридический"]["город"] . ', ' . $customer["Адреса"]["юридический"]["улица"] . ', ' . $customer["Адреса"]["юридический"]["дом"] . ', ' . $customer["Адреса"]["юридический"]["офис"]);
    $templateProcessor->setValue('customer_inn', $customer["Реквизиты"]["ИНН"]);
    $templateProcessor->setValue('customer_kpp', $customer["Реквизиты"]["КПП"]);
    $templateProcessor->setValue('customer_rs', $customer["Банковские_реквизиты"]["расчетный_счет"]);
    $templateProcessor->setValue('customer_bank_address', $customer["Банковские_реквизиты"]["адрес"]);
    $templateProcessor->setValue('customer_bank_bik', $customer["Банковские_реквизиты"]["БИК"]);
    $templateProcessor->setValue('customer_bank_ks', $customer["Банковские_реквизиты"]["кор_счет"]);
    $templateProcessor->setValue('customer_phone', $customer["Реквизиты"]["телефон"]);
    $templateProcessor->setValue('customer_dir_name', nameShort( $customer["Руководство"]["директор"]["фио"] ) );
    
    $templateProcessor->saveAs(MODX_ASSETS_PATH . 'Договор №' . $new_number . ' от ' . $invoice_date . '.docx');
    
    $output = 'assets/' . 'Договор №' . $new_number . ' от ' . $invoice_date . '.docx';
    
    return "<a class='btn btn-secondary' href='$output' download>Скачать договор</a>";
    
    
    
    // $date = date('Y-m-d_H-i-s', time()) . '_' .rand(1, 100);
    // $corePath = $modx->getOption('pdfresource.core_path', null,  $modx->getOption('core_path') . 'components/pdfresource/');
    // $pdfresource = $modx->getService('pdfresource', 'PDFResource', $corePath . 'model/pdfresource/', array(
    //     'core_path' => $corePath
    // ));

    // $pdoTools = $modx->getService('pdoTools'); 
    

    // $contract_id = 1;
    // $currentDate = date("d.m.y");
    // $content = $pdoTools->getChunk('tpl.PDF_contract', array(        
    //     'seller' => $seller,
    //     'customer' => $customer,
    //     'contract_id' => $contract_id,
    //     'current_date' => $currentDate
    // ));
    

    // $footer = $pdoTools->getChunk('tpl.PDF_contract.footer', array(        
    //     'seller' => $seller["req_dir_name"],
    //     'customer' => $customer["Руководство"]["директор"]["фио"]
    // ));
        
    // $title ='Договор';
    // $author = 'Artem Avakyan';
    // $aliasPath = MODX_ASSETS_PATH . 'pdf/';
    // $pdfresource->initPDF(array(
    //     'mode' => 'utf-8',
    //     'format' => 'A4',
    //     'defaultFontSize' => intval(8),
    //     'defaultFont' => '',
    //     'mgl' => intval(10),    // margin left
    //     'mgr' => intval(10),    // margin right
    //     'mgt' => intval(7),     // margin top
    //     'mgb' => intval(20),     // margin bottom
    //     'mgh' => intval(10),    // margin header
    //     'mgf' => intval(5),    // margin footer
    //     'orientation' => 'P',   // ориентация PDF
    //     'customFonts' => '[]',
    // ));
    
    // $pdfresource->pdf->SetTitle($title);
    // $pdfresource->pdf->SetAuthor($author);
    // $pdfresource->pdf->SetCreator('test');
    // $pdfresource->pdf->SetHTMLFooter($footer);
    // $pdfresource->pdf->WriteHTML($content, 2);
    
    
    // $tmp_path = MODX_ASSETS_PATH . 'pdf/';
    // $file_name = 'Договор №' . $contract_id. ' от ' . $currentDate . '.pdf';
    // $file_path = MODX_ASSETS_PATH . 'uploads/' . $user->get('id') . '/';
    // $web_path = 'assets/uploads/' . $user->get('id') . '/' . $file_name;
    
    // $pdfresource->pdf->Output($tmp_path . $file_name, 'F');
    
    // if(!file_exists($file_path)){
    //     mkdir($file_path);    
    // }
    // $path1 = $tmp_path . $file_name;
    // $path2 = $file_path . $file_name;
    
    
    // if (copy($path1, $path2)) {        
    //     return "<a class='btn btn-secondary' href='$web_path' download>Скачать договор</a>";
        
    // } else {
    //     return "Не удалось сформировать договор. Обратитесь к администратору";
    // }

}else {

}