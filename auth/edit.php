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



    $stmt =  $con->prepare("UPDATE `users` SET `first_name`=?,`last_name`=?,`password`=?,`user_image`=? WHERE `email` = ?");
    try {
        $image = uploadImage('image', $email);

        $stmt->execute(array($first_name, $last_name, $password, $image, $email));

        if ($stmt->rowCount() > 0) {
            $stmt = getUserByEmail($email, $con);
            $user = $stmt->fetchAll(PDO::FETCH_ASSOC);

            successStatus($user);
        } else {
            failureStatus('there is no change to edit');
        }
    } catch (\Throwable $th) {
        failureStatus($th->getMessage());
    }
} else {

    failureStatus('email not exist');
}
