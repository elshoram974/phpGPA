<?php

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

function failureStatus($message)
{
    echo json_encode(array('status' => 'failure', 'message' => $message));
}
function successStatus($data)
{
    echo json_encode(array('status' => 'success', 'data' => $data));
}
function filterRequest($variable, $canBeNull = false)
{
    $post = $_POST[$variable];
    if (empty($post)) { //|| strtolower($post) == 'null'
        if ($canBeNull) return null;
        throw new Exception("this '$variable' post is empty", 1);
    }


    $post = htmlspecialchars(strip_tags($post));

    return $post;
}


function sendMail($to, $title, $body)
{
    $header = "From: support@mrecode.com" . "\n" . "CC: mre974@gmail.com";
    mail($to, $title, $body, $header);
}
function sendCode($email, $rand)
{
    $to    = $email;
    $title = "Please verify your email";
    $body   = "your code is $rand \nplease use the code to verify your email \nif you not registered in note app .. please ignore this message";
    sendMail($to, $title, $body);
}

function getMyDate()
{
    date_default_timezone_set('Africa/Cairo');
    return date('d-m-y h:i:s', strtotime('+1 hour'));
}

define('MB', 1048576);
function uploadImage($request, $email, $path = 'uploaded_images/')
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
function deleteImage($imageName, $path = 'uploaded_images/')
{
    $fileName = $path . $imageName;
    if (file_exists($fileName)) {
        unlink($fileName);
    } else {
        return null;
    }
}
function deleteSharedSubjects($user_id, $wantEcho)
{
    global $con;
    $stmt = getUserById($user_id, $con);

    if ($stmt->rowCount() > 0) {


        try {
            $stmt = $con->prepare("DELETE FROM `shared_subjects` where `subject_user` = ?");
            $stmt->execute(array($user_id));

            if ($stmt->rowCount() > 0) {
                $subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);

                if ($wantEcho) successStatus(array('user_id' => $user_id, 'status' => 'deleted'));
            } else {
                if ($wantEcho) failureStatus(array('message' => 'no subject found'));
            }
        } catch (\Throwable $th) {
            if ($wantEcho) failureStatus($th->getMessage());
        }
    } else {
        if ($wantEcho) failureStatus('email not exist');
    }
}
