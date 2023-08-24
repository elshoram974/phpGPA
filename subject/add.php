<?php
include '../connect.php';

try {
    global $user_id;
    global $note_title;
    global $note_content;
    $user_id        = filterRequest('user_id');
    $note_title     = filterRequest('note_title');
    $note_content   = filterRequest('note_content');
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}


$stmt = getUserById($user_id, $con);

if ($stmt->rowCount() > 0) {

    $stmt =  $con->prepare("INSERT INTO `notes`( `note_title`, `note_content`, `note_user`) VALUES (?,?,?)");
    try {
        $stmt->execute(array($note_title, $note_content, $user_id));

        if ($stmt->rowCount() > 0) {

            $stmt = $con->prepare("SELECT * FROM `notes` WHERE `note_user` = ? ");
            $stmt->execute(array($user_id));

            $notes = $stmt->fetchAll(PDO::FETCH_ASSOC);


            successStatus($notes);
        } else {
            failureStatus('unknown error');
        }
    } catch (\Throwable $th) {
        failureStatus($th->getMessage());
    }
} else {
    failureStatus('email not exist');
}
