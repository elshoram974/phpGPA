<?php
include '../connect.php';

try {
    global $user_id;
    $user_id        = filterRequest('user_id');
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}


$stmt = getUserById($user_id, $con);

if ($stmt->rowCount() > 0) {

    $stmt = $con->prepare("SELECT * FROM `notes` WHERE `note_user` = ? ");
    try {
        $stmt->execute(array($user_id));

        if ($stmt->rowCount() > 0) {

            $notes = $stmt->fetchAll(PDO::FETCH_ASSOC);

            successStatus($notes);
        } else {
            failureStatus('unknown error');
        }
    } catch (\Throwable $th) {
        failureStatus($th->getMessage());
    }
} else {
    failureStatus('email not exist');
}
