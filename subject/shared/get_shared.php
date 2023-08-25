<?php
include '../../connect.php';

try {

    global $shared_user_id;

    $shared_user_id = filterRequest('shared_user_id');
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}


$stmt = getUserById($shared_user_id, $con);

if ($stmt->rowCount() > 0) {


    try {
        $stmt = $con->prepare("SELECT * from `shared_subjects` where `subject_user` = ?");
        $stmt->execute(array($shared_user_id));

        if ($stmt->rowCount() > 0) {
            $subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);


            successStatus(array('shared_user_id' => $shared_user_id, 'shared_subjects' => $subjects));
        } else {
            failureStatus(array('message' => 'no subject found'));
        }
    } catch (\Throwable $th) {
        failureStatus($th->getMessage());
    }
} else {
    failureStatus('email not exist');
}
