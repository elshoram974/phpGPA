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

    $stmt =  $con->prepare("SELECT `user_image` FROM `users` WHERE `user_id` = ?");
    $stmt->execute(array($user_id));

    $imageName = $stmt->fetch(PDO::FETCH_ASSOC)['user_image'];

    deleteImage($imageName);


    $stmt =  $con->prepare("DELETE FROM `users` WHERE `user_id` = ?");
    $stmt->execute(array($user_id));

    successStatus(array('message' => 'deleted'));
} else {
    failureStatus('email not exist');
}
