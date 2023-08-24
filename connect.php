<?php

include 'functions.php';

// $dbname = "id21176483_mrecodenote";
// $user = "id21176483_mrecode";
// $pass = "seawaYS1#";

$dbname = "cumulative_gpa";
$user = "root";
$pass = null;



$dsn = "mysql:host=localhost;dbname=$dbname;";

$options = array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8");

try {
    $con = new PDO($dsn, $user, $pass, $options);
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (\Throwable $th) {
    failureStatus($th->getMessage());
}
