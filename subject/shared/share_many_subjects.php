<?php
include '../../connect.php';

try {

    global $where;
    global $user_id;

    $where = json_decode(filter_input(INPUT_POST, 'where', 513, FILTER_FLAG_NO_ENCODE_QUOTES));
    $user_id          = filterRequest('user_id');
    deleteSharedSubjects($user_id, $where, false);
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}



$firstStmt = getUserById($user_id, $con);

if ($firstStmt->rowCount() > 0) {

    $stmt = $con->prepare("SELECT * from `subject` where `subject_user` = ? AND ($where)");
    $stmt->execute(array($user_id));



    if ($stmt->rowCount() > 0) {
        $subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $myRand = getUserSharedId($firstStmt);


        try {
            for ($i = 0; $i < count($subjects); $i++) {

                $stmt = $con->prepare("INSERT INTO `shared_subjects`(`remote_id`,`subject_nameEn`,`subject_nameAr`,`subject_note`,`subject_myMidDegree`,`subject_myYearWorkDegree`,`subject_myPracticalDegree`,`subject_myFinalDegree`,`subject_maxMidDegree`,`subject_maxYearWorkDegree`,`subject_maxPracticalDegree`,`subject_maxFinalDegree`,`subject_degree`,`subject_maxDegree`,`subject_gpa`,`subject_hours`,`subject_isCalculated`,`subject_semester`,`subject_year`,`subject_user`,`fromUser`)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
                $stmt->execute(array($subjects[$i]['remote_id'], $subjects[$i]['subject_nameEn'], $subjects[$i]['subject_nameAr'], $subjects[$i]['subject_note'], $subjects[$i]['subject_myMidDegree'], $subjects[$i]['subject_myYearWorkDegree'], $subjects[$i]['subject_myPracticalDegree'], $subjects[$i]['subject_myFinalDegree'], $subjects[$i]['subject_maxMidDegree'], $subjects[$i]['subject_maxYearWorkDegree'], $subjects[$i]['subject_maxPracticalDegree'], $subjects[$i]['subject_maxFinalDegree'], $subjects[$i]['subject_degree'], $subjects[$i]['subject_maxDegree'], $subjects[$i]['subject_gpa'], $subjects[$i]['subject_hours'], $subjects[$i]['subject_isCalculated'], $subjects[$i]['subject_semester'], $subjects[$i]['subject_year'], $subjects[$i]['subject_user'], $myRand));
            }

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
