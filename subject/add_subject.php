<?php
include '../connect.php';

try {

    global $subject_nameEn;
    global $subject_nameAr;
    global $subject_note;
    global $subject_myMidDegree;
    global $subject_myYearWorkDegree;
    global $subject_myPracticalDegree;
    global $subject_myFinalDegree;
    global $subject_maxMidDegree;
    global $subject_maxYearWorkDegree;
    global $subject_maxPracticalDegree;
    global $subject_maxFinalDegree;
    global $subject_degree;
    global $subject_maxDegree;
    global $subject_gpa;
    global $subject_hours;
    global $subject_isCalculated;
    global $subject_semester;
    global $subject_year;
    global $subject_user;



    $subject_nameEn             = filterRequest('subject_nameEn');
    $subject_nameAr             = filterRequest('subject_nameAr', true);
    $subject_note               = filterRequest('subject_note', true);
    $subject_myMidDegree        = filterRequest('subject_myMidDegree', true);
    $subject_myYearWorkDegree   = filterRequest('subject_myYearWorkDegree', true);
    $subject_myPracticalDegree  = filterRequest('subject_myPracticalDegree', true);
    $subject_myFinalDegree      = filterRequest('subject_myFinalDegree', true);
    $subject_maxMidDegree       = filterRequest('subject_maxMidDegree', true);
    $subject_maxYearWorkDegree  = filterRequest('subject_maxYearWorkDegree', true);
    $subject_maxPracticalDegree = filterRequest('subject_maxPracticalDegree', true);
    $subject_maxFinalDegree     = filterRequest('subject_maxFinalDegree', true);
    $subject_degree             = filterRequest('subject_degree');
    $subject_maxDegree          = filterRequest('subject_maxDegree');
    $subject_gpa                = filterRequest('subject_gpa', true);
    $subject_hours              = filterRequest('subject_hours');
    $subject_isCalculated       = filterRequest('subject_isCalculated', true) ?? 1;
    $subject_semester           = filterRequest('subject_semester');
    $subject_year               = filterRequest('subject_year');
    $subject_user               = filterRequest('subject_user');
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}


$stmt = getUserById($subject_user, $con);

if ($stmt->rowCount() > 0) {


    $stmt = $con->prepare(
        "INSERT INTO `subject`(`subject_nameEn`,`subject_nameAr`,`subject_note`,`subject_myMidDegree`,`subject_myYearWorkDegree`,`subject_myPracticalDegree`,`subject_myFinalDegree`,`subject_maxMidDegree`,`subject_maxYearWorkDegree`,`subject_maxPracticalDegree`,`subject_maxFinalDegree`,`subject_degree`,`subject_maxDegree`,`subject_gpa`,`subject_hours`,`subject_isCalculated`,`subject_semester`,`subject_year`,`subject_user`)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);
        UPDATE `subject`SET`remote_id` = `subject_id`WHERE `remote_id` IS NULL"
    );
    try {
        $stmt->execute(array($subject_nameEn, $subject_nameAr, $subject_note, $subject_myMidDegree, $subject_myYearWorkDegree, $subject_myPracticalDegree, $subject_myFinalDegree, $subject_maxMidDegree, $subject_maxYearWorkDegree, $subject_maxPracticalDegree, $subject_maxFinalDegree, $subject_degree, $subject_maxDegree, $subject_gpa, $subject_hours, $subject_isCalculated, $subject_semester, $subject_year, $subject_user));

        if ($stmt->rowCount() > 0) {

            $stmt = $con->prepare("SELECT * from `subject` where `subject_user` = ?");
            $stmt->execute(array($subject_user));

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
