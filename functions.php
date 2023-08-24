<?php

function getNoteById($note_id, $con)
{
    $stmt =  $con->prepare("SELECT * FROM `notes` WHERE `notes_id` = ?");
    $stmt->execute(array($note_id));
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
function filterRequest($variable)
{
    $post = htmlspecialchars(strip_tags($_POST[$variable]));
    if (empty($post)) throw new Exception("this '$variable' post is empty", 1);

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
