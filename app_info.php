<?php
include 'connect.php';

try {

    global $appId;

    $appId = filterRequest('appId');
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}



$stmt =  $con->prepare("SELECT * FROM `appinfo` WHERE `appId` = ?");
try {
    $stmt->execute(array($appId));

    if ($stmt->rowCount() > 0) {

        $appInfo = $stmt->fetch(PDO::FETCH_ASSOC);
        successStatus($appInfo);
    } else {
        failureStatus('this app id is not exist');
    }
} catch (\Throwable $th) {
    failureStatus($th->getMessage());
}
