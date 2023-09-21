<?php
include '../connect.php';



try {
    global $email;
    global $image;

    $email = filterRequest('email');
    $image = uploadImage('image', $email);
} catch (\Throwable $th) {
    failureStatus($th->getMessage());
    return;
}



$stmt = getUserByEmail($email, $con);

if ($stmt->rowCount() > 0) {


    if ($image != null) {
        $stmt =  $con->prepare("UPDATE `users` SET `user_image`= NULL WHERE `email` = ?");
        $stmt->execute(array($email));
    } else {
        $imageName = $stmt->fetch(PDO::FETCH_ASSOC)['user_image'];
        deleteImage($imageName);
    }

    $stmt =  $con->prepare("UPDATE `users` SET `user_image`=? WHERE `email` = ?");
    try {
        $stmt->execute(array($image, $email));

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
