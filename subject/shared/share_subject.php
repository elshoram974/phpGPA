<?php
include '../../connect.php';

try {

    global $user_id;
    global $remote_id;

    $user_id   = filterRequest('user_id');
    $remote_id = filterRequest('remote_id');
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}



$firstStmt = getUserById($user_id, $con);

if ($firstStmt->rowCount() > 0) {


    // deleteSharedSubjects($user_id, false);




    // try {
        $stmt = $con->prepare("SELECT * from `subject` where `remote_id` = ? AND `subject_user` = ?");
        $stmt->execute(array($remote_id, $user_id));



        if ($stmt->rowCount() > 0) {
            $subject = $stmt->fetch(PDO::FETCH_ASSOC);

            if (getSharedSubjectByRemoteId($remote_id, $con)->rowCount() != 0) return failureStatus('this subject already shared');
            $myRand = getUserSharedId($firstStmt);




            $stmt = $con->prepare("INSERT INTO `shared_subjects`(`remote_id`,`subject_nameEn`,`subject_nameAr`,`subject_note`,`subject_myMidDegree`,`subject_myYearWorkDegree`,`subject_myPracticalDegree`,`subject_myFinalDegree`,`subject_maxMidDegree`,`subject_maxYearWorkDegree`,`subject_maxPracticalDegree`,`subject_maxFinalDegree`,`subject_degree`,`subject_maxDegree`,`subject_gpa`,`subject_hours`,`subject_isCalculated`,`subject_semester`,`subject_year`,`subject_user`,`fromUser`)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
            try {
                $stmt->execute(array($subject['remote_id'], $subject['subject_nameEn'], $subject['subject_nameAr'], $subject['subject_note'], $subject['subject_myMidDegree'], $subject['subject_myYearWorkDegree'], $subject['subject_myPracticalDegree'], $subject['subject_myFinalDegree'], $subject['subject_maxMidDegree'], $subject['subject_maxYearWorkDegree'], $subject['subject_maxPracticalDegree'], $subject['subject_maxFinalDegree'], $subject['subject_degree'], $subject['subject_maxDegree'], $subject['subject_gpa'], $subject['subject_hours'], $subject['subject_isCalculated'], $subject['subject_semester'], $subject['subject_year'], $subject['subject_user'], $myRand));


                if ($stmt->rowCount() > 0) {

                    $stmt = $con->prepare("SELECT * from `shared_subjects` where `subject_user` = ?");
                    $stmt->execute(array($user_id));

                    $subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);
                    successStatus(array('user_sharedId' => $myRand, 'shared_subjects' => $subjects));
                } else {
                    failureStatus('unknown error');
                }
            } catch (\Throwable $th) {
                failureStatus($th->getMessage());
            }
        } else {
            failureStatus('this subject not exist');
        }
    // } catch (\Throwable $th) {
    //     failureStatus($th->getMessage());
    // }
} else {
    failureStatus('email not exist');
}
