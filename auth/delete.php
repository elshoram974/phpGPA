<?php
include '../connect.php';

try {
    global $user_id;
    $user_id      = filterRequest('user_id');
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}


$stmt = getUserById($user_id, $con);

if ($stmt->rowCount() > 0) {

    $stmt =  $con->prepare("DELETE FROM `users` WHERE `user_id` = ?");
    $stmt->execute(array($user_id));

    successStatus('deleted');
} else {
    failureStatus('email not exist');
}
