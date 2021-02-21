<?php
$user = $hook->getValue('updateprofile.user');
$profile = $hook->getValue('updateprofile.profile');


if (isset($_FILES['file_contract'])) {
    $file = $_FILES['file_contract'];

    if($file['error'] === 0) {
        $nameFile = $file['name'];
        $extFile = mb_strtolower(pathinfo($nameFile, PATHINFO_EXTENSION));
        $uniqNameFile = uniqid('file_', true).'.'.$extFile;
        $tmp_name = $file["tmp_name"];
        $file_path = MODX_ASSETS_PATH . 'uploads/' . $user->get('id') . '/contract/';
        
        if(!file_exists($file_path)){
            mkdir($file_path);    
        }
        $profile->set('user_contract', '/assets/uploads/' . $user->get('id') . '/contract/' . $uniqNameFile);
        move_uploaded_file($tmp_name, $file_path . $uniqNameFile);   
    }
}

$profile->save();
return true;








// $output = true;
// // разрешённые расширения файлов
// $allowedExt = array('jpg','png', 'pdf');
// // максимальный размер файла (512 Кбайт)
// $maxFileSize = 512 * 1024;
// // имя файла
// $fileName = basename( $_FILES[$key]['name'] );
// // размер
// $fileSize = filesize( $_FILES[$key]['tmp_name'] );
// // расширение файла
// $fileExt = mb_strtolower(pathinfo($fileName, PATHINFO_EXTENSION));
// // если имя файла не пустое
// if ($fileName != '') {
//   if(!in_array($fileExt, $allowedExt)) {
//     // файл имеет недопустимый тип
//     $errorMsg = 'Файл ' . $fileName . ' имеет не разрешённый тип.';
//     $validator->addError($key, $errorMsg);
//     $output = false; // возвращаем false
//   }
//   if($fileSize > $maxFileSize) {
//     // файл имеет размер больше максимального
//     $errorMsg = 'Размер файла '. $fileName .' превышает 512 Кбайт.';
//     $validator->addError($key,$errorMsg);
//     $output = false; // возвращаем false
//   }
// }
// return $output;