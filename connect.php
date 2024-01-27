<?php
header('Access-Control-Allow-Origin: https://mrecode.com');
header('Access-Control-Allow-Credentials: true');
header('Content-Type: application/json');

include 'functions.php';

$dbname = "gpa_pro";
$user = "mrecode";
$pass = "seawaYS1#";



$dsn = "mysql:host=localhost;dbname=$dbname;";

$options = array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8");

try {
    $con = new PDO($dsn, $user, $pass, $options);
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (\Throwable $th) {
    failureStatus($th->getMessage());
}
