<?php
include '../connect.php';

try {

    global $subject_id;

    $subject_id = filterRequest('subject_id');
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}



$stmt = getSubjectById($subject_id, $con);

if ($stmt->rowCount() > 0) {

    $stmt = $con->prepare(
        "SELECT * FROM `subject` WHERE `subject_id` = ?;
     DELETE FROM `subject` WHERE `subject_id` = ?"
    );
    try {
        $stmt->execute(array($subject_id, $subject_id));

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
    failureStatus('subject not exist');
}
