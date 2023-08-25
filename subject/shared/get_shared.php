<?php
include '../../connect.php';

try {

    global $user_sharedId;

    $user_sharedId = filterRequest('user_sharedId');
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}

try {
    $stmt = $con->prepare("SELECT * from `shared_subjects` where `fromUser` = ?");
    $stmt->execute(array($user_sharedId));

    if ($stmt->rowCount() > 0) {
        $subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);


        successStatus(array('user_sharedId' => $user_sharedId, 'shared_subjects' => $subjects));
    } else {
        failureStatus('no subject found');
    }
} catch (\Throwable $th) {
    failureStatus($th->getMessage());
}
