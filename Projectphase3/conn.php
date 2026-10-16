<?php
$host = getenv('DB_HOST') ?: 'localhost';
$user = getenv('DB_USER');
$password = getenv('DB_PASSWORD');
$database = getenv('DB_NAME') ?: 'bank';
if ($user === false || $password === false) {
    die('Set DB_USER and DB_PASSWORD in the PHP server environment.');
}
$conn = mysqli_connect($host, $user, $password, $database);
if (!$conn) {
    die('Database connection failed. Check the database environment settings.');
}
?>
