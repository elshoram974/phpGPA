<?php
include '../../connect.php';


try {

    global $user_id;
    global $where;

    $user_id = filterRequest('user_id');
    $where = json_decode(filter_input(INPUT_POST, 'where', 513, FILTER_FLAG_NO_ENCODE_QUOTES));
} catch (\Throwable $th) {
    failureStatus('error when get post');
    return;
}

deleteSharedSubjects($user_id, $where, true);
