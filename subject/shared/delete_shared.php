<?php
include '../../connect.php';


try {

    global $user_id;
    global $remote_id;

    $user_id = filterRequest('user_id');
    $remote_id = filterRequest('remote_id');
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}

deleteSharedSubjects($user_id, $remote_id, true);


function deleteSharedSubjects($user_id, $remote_id, $wantEcho)
{
    global $con;
    $stmt = getUserById($user_id, $con);

    if ($stmt->rowCount() > 0) {


        try {
            $stmt = $con->prepare("DELETE FROM `shared_subjects` where `subject_user` = ? AND `remote_id` = ?");
            $stmt->execute(array($user_id, $remote_id));

            if ($stmt->rowCount() > 0) {
                // $subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);

                // search if no else shared subjects
                $stmt = $con->prepare("SELECT * from `shared_subjects` where `subject_user` = ? AND `remote_id` = ?");
                $stmt->execute(array($user_id, $remote_id));

                if ($stmt->rowCount() == 0) {
                    $stmt =  $con->prepare("UPDATE `users` SET `user_sharedId`= NULL WHERE `user_id` = ?");
                    $stmt->execute(array($user_id));
                }
                // --------------------------------




                if ($wantEcho) successStatus(array('user_id' => $user_id, 'remote_id' => $remote_id, 'status' => 'deleted'));
            } else {
                if ($wantEcho) failureStatus('no subject found');
            }
        } catch (\Throwable $th) {
            if ($wantEcho) failureStatus($th->getMessage());
        }
    } else {
        if ($wantEcho) failureStatus('email not exist');
    }
}
