<?php
include '../connect.php';

try {

    global $user_id;

    $user_id = filterRequest('user_id');
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}



$stmt = getUserById($user_id, $con);

if ($stmt->rowCount() > 0) {

    $stmt = $con->prepare("SELECT * FROM `subject` WHERE `subject_user` = ?");
    try {
        $stmt->execute(array($user_id));

        if ($stmt->rowCount() > 0) {

            $subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);
            successStatus($subjects);
        } else {
            failureStatus('unknown error');
        }
    } catch (\Throwable $th) {
        failureStatus($th->getMessage());
    }
} else {
    failureStatus('email not exist');
}
