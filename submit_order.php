<?php
// Connect to MySQL Database
$servername = "localhost";
$username = "foundationTech";
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

// Output items as JSON
echo json_encode($items);

// Get the JSON input
$input = file_get_contents('php://input');
$orderData = json_decode($input, true);

if (!$orderData || !isset($orderData['name']) || !isset($orderData['cart'])) {
    echo json_encode(["error" => "Invalid order data"]);
    exit;
}

// Prepare order details
$customer_name = $orderData['name'];
$phone = $orderData['phone'];
$address = $orderData['address'];
$email = $orderData['email'];
$total = $orderData['total'];

// Insert into orders table
$stmt = $conn->prepare("INSERT INTO orders (name, phone, address, email, total) VALUES (?, ?, ?, ?, ?)");
$stmt->bind_param("ssssd", $customer_name, $phone, $address, $email, $total);
if (!$stmt->execute()) {
    echo json_encode(["error" => "Error inserting order: " . $stmt->error]); 
    exit;
}

$order_id = $stmt->insert_id; // Get the newly created order ID
$stmt->close();

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
}

$stmt->close();
$conn->close();

// Return success response
echo json_encode(["success" => "Order placed successfully!"]);

?>
