/*Order table holds customer's info along with the total of the invoice.*/
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    address TEXT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*Represents the gift shop items as displayed on the webpage.*/
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    item_id INT,
    description TEXT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

/*When orders are filled, information from this table are emailed as an encrypted invoice. In other words, this table represents the true order items.*/
CREATE TABLE scp_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    scp_id INT,
    scp_classification VARCHAR,
    description TEXT NOT NULL,
    FOREIGN KEY (scp_id) REFERENCES order_items(item_id)
);
