<?php
// Connect to MySQL Database
$servername = "database";
$username = "root";
$password = "secureContainProtect";
$database = "crazyPizzaGiftDB";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query to fetch items from the database
// $sql = "SELECT id, name, price, description, image FROM items";
$sql = "SELECT item_id AS id, name, description, price, image_path FROM giftshop_items";
$result = $conn->query($sql);

$items = [];
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $items[] = $row;
    }
}

// Get the JSON input
$input = file_get_contents('php://input');
$orderData = json_decode($input, true);

if (!$orderData || !isset($orderData['name']) || !isset($orderData['cart'])) {
    echo json_encode(["error" => "Invalid order data"]);
    exit;
}

// Prepare order details
extract($orderData);
$conn = new mysqli($servername, $username, $password, $database);


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


$sql = "INSERT INTO orders (name, phone, address, email, total) VALUES ('$name', '$phone', '$address', '$email', $total)";

$stmt = $conn->prepare($sql);
if (!$stmt->execute()) {
    echo json_encode(["error" => "Error inserting order: " . $stmt->error]); 
    exit;
}


$order_id = $stmt->insert_id;
$sql = "SELECT * from orders";

$file = fopen("/var/www/receipts/order".$order_id.".txt", "w");
fwrite($file, "Name: ".$name.", Email: ".$email."\n");
// Insert each item into order_items table
foreach ($orderData['cart'] as $item) {
    $item_id = $item['id'];
    $quantity = $item['quantity'];

    $stmt = $conn->prepare("INSERT INTO order_items (order_id, item_id, quantity) VALUES (?, ?, ?)");
    $stmt->bind_param("iii", $order_id, $item_id, $quantity);
    if (!$stmt->execute()) {
        echo json_encode(["error" => "Error inserting order item: " . $stmt->error]); 
        exit;
    }
    fwrite($file, "Item ID: ".$item_id.", Quantity:"." $quantity"."\n");
}

$stmt->close();
$conn->close();
fclose($file);

// Return success response
echo json_encode(["success" => "Order placed successfully!", "order_id" => $order_id]);

?>
