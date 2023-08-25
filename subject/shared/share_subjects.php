<?php
include '../../connect.php';

try {

    global $user_id;

    $user_id = filterRequest('user_id');
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}


$stmt = getUserById($user_id, $con);

if ($stmt->rowCount() > 0) {
    deleteSharedSubjects($user_id, false);



    try {
        $stmt = $con->prepare(
            "SELECT * from `subject` where `subject_user` = ?;
                UPDATE `subject`SET`remote_id` = `subject_id` WHERE `remote_id` IS NULL
                "
        );
        $stmt->execute(array($user_id));

        if ($stmt->rowCount() > 0) {
            $subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);
            $temp_subjects = array();



            foreach ($subjects as $subject) {
                $stmt = $con->prepare("INSERT INTO `shared_subjects`(`subject_nameEn`,`subject_nameAr`,`subject_note`,`subject_myMidDegree`,`subject_myYearWorkDegree`,`subject_myPracticalDegree`,`subject_myFinalDegree`,`subject_maxMidDegree`,`subject_maxYearWorkDegree`,`subject_maxPracticalDegree`,`subject_maxFinalDegree`,`subject_degree`,`subject_maxDegree`,`subject_gpa`,`subject_hours`,`subject_isCalculated`,`subject_semester`,`subject_year`,`subject_user`)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
                try {
                    $stmt->execute(
                        array($subject['subject_nameEn'], $subject['subject_nameAr'], $subject['subject_note'], $subject['subject_myMidDegree'], $subject['subject_myYearWorkDegree'], $subject['subject_myPracticalDegree'], $subject['subject_myFinalDegree'], $subject['subject_maxMidDegree'], $subject['subject_maxYearWorkDegree'], $subject['subject_maxPracticalDegree'], $subject['subject_maxFinalDegree'], $subject['subject_degree'], $subject['subject_maxDegree'], $subject['subject_gpa'], $subject['subject_hours'], $subject['subject_isCalculated'], $subject['subject_semester'], $subject['subject_year'], $subject['subject_user'])
                    );

                    if ($stmt->rowCount() > 0) {

                        $stmt = $con->prepare("SELECT * from `shared_subjects` where `subject_user` = ?");
                        $stmt->execute(array($user_id));

                        $subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);
                        $temp_subjects[] = $subject;
                    } else {
                        failureStatus(array('error' => 'unknown error', 'subjects_shared' => $temp_subjects));
                        return;
                    }
                } catch (\Throwable $th) {
                    failureStatus(array('error' => $th->getMessage(), 'subjects_shared' => $temp_subjects));
                    return;
                }
            }
            successStatus(array('user_id' => $user_id, 'shared_subjects' => $subjects));
        } else {
            failureStatus(array('message' => 'no subject found'));
        }
    } catch (\Throwable $th) {
        failureStatus($th->getMessage());
    }
} else {
    failureStatus('email not exist');
}
