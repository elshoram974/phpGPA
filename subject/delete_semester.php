<?php
include '../connect.php';

try {

    global $subject_semester;
    global $subject_year;
    global $subject_user;

    $subject_semester = filterRequest('subject_semester');
    $subject_year = filterRequest('subject_year');
    $subject_user = filterRequest('subject_user');
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}



$stmt = getUserById($subject_user, $con);

if ($stmt->rowCount() > 0) {

    $stmt = $con->prepare(
        "DELETE FROM `subject` WHERE `subject_user` = ? AND `subject_year` = ? And `subject_semester` = ?"
    );
    try {
        $stmt->execute(array($subject_user, $subject_year, $subject_semester));

        if ($stmt->rowCount() > 0) {
            successStatus(array('message' => 'semester is deleted successfully'));
        } else {
            failureStatus('semester not exist');
        }
    } catch (\Throwable $th) {
        failureStatus($th->getMessage());
    }
} else {
    failureStatus('email not exist');
}
