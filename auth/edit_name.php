<?php
include '../connect.php';



try {
    global $first_name;
    global $last_name;
    global $email;

    $first_name = filterRequest('first_name');
    $last_name  = filterRequest('last_name');
    $email      = filterRequest('email');
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}



$stmt = getUserByEmail($email, $con);

if ($stmt->rowCount() > 0) {



    $stmt =  $con->prepare("UPDATE `users` SET `first_name`=?,`last_name`=? WHERE `email` = ?");
    try {
        $stmt->execute(array($first_name, $last_name, $email));

        if ($stmt->rowCount() > 0) {
            $stmt = getUserByEmail($email, $con);
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            successStatus($user);
        } else {
            failureStatus('there is no change to save');
        }
    } catch (\Throwable $th) {
        failureStatus($th->getMessage());
    }
} else {

    failureStatus('email not exist');
}
