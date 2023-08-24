<?php
include '../connect.php';

try {
    global $notes_id;
    global $note_title;
    global $note_content;
    $notes_id        = filterRequest('notes_id');
    $note_title     = filterRequest('note_title');
    $note_content   = filterRequest('note_content');
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}


$stmt = getNoteById($notes_id, $con);

if ($stmt->rowCount() > 0) {

    $stmt =  $con->prepare("UPDATE `notes` SET `note_title`=?,`note_content`= ?,`last_edit`= ? WHERE `notes_id`= ?");
    try {
        $last_edit = getMyDate();
        $stmt->execute(array($note_title, $note_content, $last_edit, $notes_id));

        if ($stmt->rowCount() > 0) {

            $stmt = $con->prepare("SELECT * FROM `notes` WHERE `notes_id` = ? ");
            $stmt->execute(array($notes_id));

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
