<?php
// Database connection credentials
$servername = "localhost";
$username = "foundationTech";
$password = "secureContainProtect";
$database = "crazyPizzaGiftDB";

// Connect to the database
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die(json_encode(["error" => "Database connection failed: " . $conn->connect_error]));
}

// SQL query to fetch items
$sql = "SELECT item_id AS id, name, description, price, image_path FROM giftshop_items";
$result = $conn->query($sql);

// Prepare response
$items = [];
if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $items[] = $row;
    }
}

// Close connection
$conn->close();

// Return JSON response
// header('Content-Type: application/json');
echo json_encode($items);
?>