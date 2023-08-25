<?php
include '../../connect.php';

try {

    global $user_id;

    $user_id = filterRequest('user_id');
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}

deleteSharedSubjects($user_id, true);
