<?php
include '../connect.php';

try {
    global $first_name;
    global $last_name;
    global $email;
    global $password;
    $first_name = filterRequest('first_name');
    $last_name  = filterRequest('last_name');
    $email      = filterRequest('email');
    $password   = sha1(filterRequest('password'));
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}


$stmt = getUserByEmail($email, $con);

if ($stmt->rowCount() > 0) {
    failureStatus('email already exist');
} else {

    $stmt =  $con->prepare("INSERT INTO `users`(`first_name`, `last_name`, `email`, `password`) VALUES (?,?,?,?)");
    try {
        $stmt->execute(array($first_name, $last_name, $email, $password));

        if ($stmt->rowCount() > 0) {
            $stmt = getUserByEmail($email, $con);
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            successStatus($user);
        } else {
            failureStatus('unknown error');
        }
    } catch (\Throwable $th) {
        failureStatus($th->getMessage());
    }
}
