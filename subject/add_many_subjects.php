<?php
include '../connect.php';

try {

    global $subjects_SQLCode;
    global $subject_user;
    
    $subjects_SQLCode           = json_decode(filter_input(INPUT_POST, 'subjects_SQLCode', 513, FILTER_FLAG_NO_ENCODE_QUOTES));
    $subject_user               = filterRequest('subject_user');

} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}


$stmt = getUserById($subject_user, $con);

if ($stmt->rowCount() > 0) {


    $stmt = $con->prepare(
        "INSERT INTO `subject`(`subject_user`, `subject_nameEn`, `subject_nameAr`, `subject_myMidDegree`, `subject_myYearWorkDegree`, `subject_myPracticalDegree`, `subject_myFinalDegree`, `subject_maxMidDegree`, `subject_maxYearWorkDegree`, `subject_maxPracticalDegree`, `subject_maxFinalDegree`, `subject_degree`, `subject_maxDegree`, `subject_gpa`, `subject_hours`, `subject_isCalculated`, `subject_semester`, `subject_year`) VALUES $subjects_SQLCode ;
        UPDATE `subject`SET`remote_id` = `subject_id`WHERE `remote_id` IS NULL"
    );
    try {
        $stmt->execute();

        if ($stmt->rowCount() > 0) {

            $stmt = $con->prepare("SELECT * from `subject` where `subject_user` = ?");
            $stmt->execute(array($subject_user));

            $subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);
            successStatus($subjects);
        } else {
            failureStatus('unknown error, subjects are not added');
        }
    } catch (\Throwable $th) {
        failureStatus($subjects_SQLCode);
        failureStatus($th->getMessage());
    }
} else {
    failureStatus('email not exist');
}
