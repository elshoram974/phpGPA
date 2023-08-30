<?php

function getSharedSubjectByRemoteId($remote_id, $con)
{
    $stmt =  $con->prepare("SELECT * FROM `shared_subjects` WHERE `remote_id` = ?");
    $stmt->execute(array($remote_id));
    return $stmt;
}
function getSubjectById($subject_id, $con)
{
    $stmt =  $con->prepare("SELECT * FROM `subject` WHERE `subject_id` = ?");
    $stmt->execute(array($subject_id));
    return $stmt;
}
function getUserByEmail($email, $con)
{
    $stmt =  $con->prepare("SELECT * FROM `users` WHERE `email` = ?");
    $stmt->execute(array($email));
    return $stmt;
}
function getUserById($user_id, $con)
{
    $stmt =  $con->prepare("SELECT * FROM `users` WHERE `user_id` = ?");
    $stmt->execute(array($user_id));
    return $stmt;
}

function failureStatus($message): void
{
    echo json_encode(array('status' => 'failure', 'data' => array('message' => $message)));
}
function successStatus($data): void
{
    echo json_encode(array('status' => 'success', 'data' => $data));
}
function filterRequest($variable, $canBeNull = false): string | null
{
    $post = $_POST[$variable];
    if (empty($post)) { //|| strtolower($post) == 'null'
        if ($canBeNull) return null;
        throw new Exception("this '$variable' post is empty", 1);
    }


    $post = htmlspecialchars(strip_tags($post));

    return $post;
}


function sendMail($to, $title, $body): void
{
    // تحديد أن البريد الإلكتروني يحتوي على نص HTML

    $headers = "MIME-Version: 1.0" . "\r\n";
    $headers .= "Content-type: text/html; charset=UTF-8" . "\r\n";
    $headers .= "From: GPA Pro <info@mrecode.com>";


    mail($to, $title, $body, $headers);
}

function sendCode($title, $email, $rand): void
{
    $to = $email;

    // تنسيق النص
    $body = "<div style='text-align: start;'>
                Your code is <span style='font-weight: bold; font-size: larger;'>$rand</span>
                <br>
                Please use the code to $title.
                <br>
                If you're not registered in the GPA Pro App, please ignore this message.
            </div>";


    // إرسال البريد الإلكتروني
    sendMail($to, $title, $body);
}

function getMyDate(): string
{
    date_default_timezone_set('Africa/Cairo');
    return date('d-m-y h:i:s', strtotime('+1 hour'));
}

define('MB', 1048576);
function uploadImage($request, $email, $path = 'uploaded_images/'): string|null
{
    $image = isset($_FILES[$request]) ? $_FILES[$request] : null;
    if (!empty($image)) {
        $name      = $image['name']; // IMG_20220827_131611.jpg
        $full_path = $image['full_path']; //  IMG_20220827_131611.jpg
        $type      = $image['type'];  // image/jpeg
        $tmp_name  = $image['tmp_name']; //C:\xampp\tmp\php11BE.tmp
        $error     = $image['error']; // 0
        $size      = $image['size']; // 1290266

        $allowExt = array("jpg", "jpeg", "png");
        $strToArray = explode('.', $name);
        $ext = strtolower(end($strToArray));

        if ($size > 10 * MB) {
            throw new Exception("image size is big = " . $size / MB . "MB .. should be less than or equal 10 MB", 1);
        } elseif (!in_array($ext, $allowExt)) {
            throw new Exception("this extension '$ext' not photo", 1);
        } elseif ($error > 0) {
            throw new Exception("upload image error = " . $error, 1);
        } else {
            $name = "$email.$ext";
            move_uploaded_file($tmp_name, $path . $name);
            return $name;
        }
    } else {
        return null;
    }
}
function deleteImage($imageName, $path = 'uploaded_images/'): void
{
    $fileName = ($imageName == null ? null : $path . $imageName);
    try {
        if (file_exists($fileName)) unlink($fileName);
    } catch (\Throwable $th) {
    }
}


function getUserSharedId($userStmt): int
{
    global $con;
    $tempUser = $userStmt->fetch(PDO::FETCH_ASSOC);
    $myRand = $tempUser['user_sharedId'];


    if ($myRand == null) {
        while (true) {

            $myRand = rand(1000000000, 9999999999);

            $tempStmt = $con->prepare("SELECT `user_sharedId` FROM `users` WHERE `user_sharedId` = ? ");
            $tempStmt->execute(array($myRand));

            if ($tempStmt->rowCount() == 0) {
                $stmt =  $con->prepare("UPDATE `users` SET `user_sharedId`=?  WHERE `user_id` = ?");
                $stmt->execute(array($myRand,  $tempUser['user_id']));
                break;
            }
        }
    }
    return $myRand;
}
