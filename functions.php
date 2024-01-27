<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'phpmailer/Exception.php';
require 'phpmailer/PHPMailer.php';
require 'phpmailer/SMTP.php';
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

    $mail = new PHPMailer();

    //Server settings
    $mail->SMTPDebug = SMTP::DEBUG_OFF;
    $mail->isSMTP();
    $mail->Host       = 'mail.mrecode.com';
    $mail->SMTPAuth   = true;
    $mail->Username   = 'info@mrecode.com';
    $mail->Password   = 'seawaYS1#@';
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
    $mail->Port       = 465;

    //Recipients
    $mail->setFrom('info@mrecode.com', 'GPA PRO');
    $mail->addAddress($to);

    //Content
    $mail->isHTML(true);
    $mail->Subject = $title;
    $mail->Body    = $body;
    // $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

    $mail->send();
}

function sendCode($title, $email, $rand): void
{
    // تنسيق النص
    $body = "<div style='text-align: start;font-size: 16px;'>
                Your code is <span style='font-weight: bold; font-size: 25px;vertical-align: middle;'>$rand</span>
                <br>
                Please use the code to <span style='font-weight: bold;font-size: 20px;vertical-align: middle;'>$title</span>.
                <br>
                If you're not registered in the <span style='font-weight: bold;font-size: 20px;vertical-align: middle;'>GPA PRO</span> App, please ignore this message.
            </div>";


    // إرسال البريد الإلكتروني
    sendMail($email, $title, $body);
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

        $photoMaxSize = 10;

        if ($size > $photoMaxSize * MB) {
            throw new Exception("image size is big = " . $size / MB . "MB .. should be less than or equal $photoMaxSize MB", 1);
        } elseif (!in_array($ext, $allowExt)) {
            throw new Exception("this extension '$ext' not to photo", 1);
        } elseif ($error > 0) {
            throw new Exception("upload image error = " . $error, 1);
        } else {
            $name = "$email.$ext";
            move_uploaded_file($tmp_name, $path . $name);
            return $name;
        }
    }


    return null;
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


function deleteSharedSubjects($user_id, $where, $wantEcho)
{
    global $con;
    $stmt = getUserById($user_id, $con);

    if ($stmt->rowCount() > 0) {


        try {
            $stmt = $con->prepare("DELETE FROM `shared_subjects` where `subject_user` = ? AND ($where)");
            $stmt->execute(array($user_id));

            if ($stmt->rowCount() > 0) {
                // $subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);

                // search if no else shared subjects
                $stmt = $con->prepare("SELECT * from `shared_subjects` where `subject_user` = ?");
                $stmt->execute(array($user_id));
                $subjects =  $stmt->fetchAll(PDO::FETCH_ASSOC);

                $fromUser = null;



                if ($stmt->rowCount() == 0) {
                    $stmt =  $con->prepare("UPDATE `users` SET `user_sharedId`= NULL WHERE `user_id` = ?");
                    $stmt->execute(array($user_id));
                } else {
                    $fromUser =  $subjects[0]['fromUser'];
                }
                // --------------------------------




                if ($wantEcho) successStatus(array('user_sharedId' => $fromUser, 'shared_subjects' => $subjects));
            } else {
                if ($wantEcho) failureStatus('no subject found');
            }
        } catch (\Throwable $th) {
            if ($wantEcho) failureStatus($th->getMessage());
        }
    } else {
        if ($wantEcho) failureStatus('email not exist');
    }
}
