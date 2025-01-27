<?php
$path = $_GET['order'];
if (strpos($path, '.txt') == false) {
    $path = $path.".txt";
}
include "/var/www/receipts/order".$path;
