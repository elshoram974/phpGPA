<?php
include '../connect.php';



try {
    global $email;
    global $newPassword;

    $email         = filterRequest('email');
    $newPassword   = sha1(filterRequest('newPassword'));
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}



$stmt = getUserByEmail($email, $con);

if ($stmt->rowCount() > 0) {



    $stmt =  $con->prepare("UPDATE `users` SET `password`=? WHERE `email` = ?");
    try {

        $stmt->execute(array($newPassword, $email));

        if ($stmt->rowCount() > 0) {
            $stmt = getUserByEmail($email, $con);
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            successStatus($user);
        } else {
            failureStatus('Entered same password');
        }
    } catch (\Throwable $th) {
        failureStatus($th->getMessage());
    }
} else {

    failureStatus('email not exist');
}
