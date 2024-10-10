<?php
// Connect to MySQL Database
$servername = "localhost";
$username = "root";
$password = "";
$database = "scp_gift_shop";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$input
