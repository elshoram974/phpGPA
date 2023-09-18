<?php
include '../connect.php';

try {

    global $where_code;
    global $user_id;

    $where_code = json_decode(filter_input(INPUT_POST, 'where_code', 513, FILTER_FLAG_NO_ENCODE_QUOTES));
    $user_id    = filterRequest('user_id');
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}



$stmt = getUserById($user_id, $con);

if ($stmt->rowCount() > 0) {

    $stmt = $con->prepare("DELETE FROM `subject` WHERE $where_code");
    try {
        $stmt->execute(array());

        if ($stmt->rowCount() > 0) {
            $subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);
            successStatus(array('shared_subjects' => $subjects));
        } else {
            failureStatus('unknown error, subjects are not deleted, may it is already deleted');
        }
    } catch (\Throwable $th) {
        failureStatus($th->getMessage());
    }
} else {
    failureStatus('email not exist');
}
