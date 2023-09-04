<?php
include '../connect.php';

try {
    global $email;
    global $password;
    $email      = filterRequest('email');
    $password   = sha1(filterRequest('password'));
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}


$stmt = getUserByEmail($email, $con);

if ($stmt->rowCount() > 0) {
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($user['password'] == $password) {
        if ($user['is_verified'] == 0) {
            failureStatus('Your account is not verified');
        } else {

            // to save login date
            $stmt =  $con->prepare("UPDATE `users` SET `last_login`= CURRENT_TIMESTAMP WHERE `email` = ? AND `password` = ?");
            $stmt->execute(array($email, $password));
            // -----------------

            $stmt = getUserByEmail($email, $con);
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            successStatus($user);
        }
    } else {
        failureStatus('Wrong password');
    }
} else {
    failureStatus('email not exist');
}
