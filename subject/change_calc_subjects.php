<?php
include '../connect.php';

try {

    global $where_code;
    global $make_them_calculated;
    global $user_id;

    $make_them_calculated = json_decode(filter_input(INPUT_POST, 'make_them_calculated', 513, FILTER_FLAG_NO_ENCODE_QUOTES));
    $where_code           = json_decode(filter_input(INPUT_POST, 'where_code', 513, FILTER_FLAG_NO_ENCODE_QUOTES));
    $user_id              = filterRequest('user_id');

} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}


$stmt = getUserById($user_id, $con);

if ($stmt->rowCount() > 0) {

    $stmt = $con->prepare(
        "UPDATE `subject` SET `subject_isCalculated`= $make_them_calculated, `subject_lastEdit` = CURRENT_TIMESTAMP WHERE $where_code"
    );
    try {
        $stmt->execute();


        if ($stmt->rowCount() > 0) {
            $stmt = $con->prepare("SELECT * from `subject` where `subject_user` = ?");
            $stmt->execute(array($user_id));

            $subject = $stmt->fetchAll(PDO::FETCH_ASSOC);
            successStatus(array('shared_subjects' => $subject));
        } else {
            failureStatus('there is no change to update');
        }
    } catch (\Throwable $th) {
        failureStatus($th->getMessage());
    }
} else {
    failureStatus('email not exist');
}
