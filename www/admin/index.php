<?php
// Database connection
include './login.php';
$servername = "database";
$username = "root";
$password = "secureContainProtect";
$database = "crazyPizzaGiftDB";

$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch orders and their items
$sql = "SELECT *
        FROM orders 
        ORDER BY created_at DESC";

$result = $conn->query($sql);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        .actions {
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>Admin Dashboard</h1>
    <h2>Orders</h2>
    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Customer Name</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Email</th>
                <th>Total</th>
                <th>Created At</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($result && $result->num_rows > 0): ?>
                <?php while ($row = $result->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo $row['id']; ?></td>
                        <td><?php echo ($row['name']); ?></td>
                        <td><?php echo ($row['phone']); ?></td>
                        <td><?php echo ($row['address']); ?></td>
                        <td><?php echo ($row['email']); ?></td>
                        <td>$<?php echo number_format($row['total'], 2); ?></td>
                        <td><?php echo $row['created_at']; ?></td>
                    </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr>
                    <td colspan="8">No orders found.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>

    <footer>
        <p>&copy; 2024 Steve's Crazy Pizza Parlor. All rights reserved.</p>
    </footer>
</body>
</html>
<?php
$conn->close();
?>
