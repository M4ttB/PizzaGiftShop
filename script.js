// Sample items in the catalog
// const items = [
//     { id: 1, name: "SCP-173 Statue", price: 10.00, description: "A creepy statue that moves when unobserved.", image: "images/item1.jpg" },
//     { id: 2, name: "SCP-999 Plush", price: 5.00, description: "A plush toy of SCP-999, known as 'The Tickle Monster'.", image: "images/item2.jpg" },
//     { id: 3, name: "SCP-682 'Hate' Shirt", price: 20.00, description: "A t-shirt featuring SCP-682, the most hostile entity in the Foundation.", image: "images/item3.jpg" }
// ];

let items; //To be populated by the database dynamically

let cart = [];

// Fetch items from the backend
/*function fetchItems() {
    fetch('fetch_items.php')
        .then(response => response.json())
        .then(data => {
            items = data;  // Populate items with data from the database
            displayCatalog();  // Display catalog once items are loaded
        })
        .catch(error => {
            console.error('Error fetching items:', error);
        });
} */

// Fetch items from the server
function fetchCatalog() {
    fetch('fetch_items.php') 
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json(); 
        })
        .then(catalog => {
            items = catalog
            displayCatalog(); 
        })
        .catch(error => console.error('Error fetching items:', error));
}


// Populate the catalog with items
/*function displayCatalog() {
    const itemList = document.getElementById('item-list');
    itemList.innerHTML = "";
    items.forEach(item => {
        const itemElement = `
            <div class="item" data-id="${item.id}">
                <img src="${item.image}" alt="${item.name}">
                <h3>${item.name}</h3>
                <p>${item.description}</p>
                <p>$${item.price.toFixed(2)}</p>
                <button onclick="addToCart(${item.id})">Add to Cart</button>
            </div>
        `;
        itemList.innerHTML += itemElement;
    });
} */

// Populate the catalog with items
function displayCatalog() {
    const itemList = document.getElementById('item-list');
    itemList.innerHTML = "";
    
    items.forEach(item => {
        const itemElement = `
            <div class="item" data-id="${item.id}">
                <img src="${item.image_path}" alt="${item.name}" loading="lazy">
                <h3>${item.name}</h3>
                <p>${item.description}</p>
                <p>$${item.price}</p>
                <button onclick="addToCart(${item.id})">Add to Cart</button>
            </div>
        `;
        itemList.innerHTML += itemElement;
    });
}

// Add an item to the cart
function addToCart(itemId) {
    const item = items.find(i => i.id == itemId);
    const existingItem = cart.find(i => i.id == itemId);

    console.log(itemId, items)

    if (existingItem) {
        existingItem.quantity += 1;
    } else {
        cart.push({ ...item, quantity: 1 });
    }

    updateCart();
}

// Update the cart UI
function updateCart() {
    const cartItems = document.getElementById('cart-items');
    const totalElement = document.getElementById('total');
    cartItems.innerHTML = "";
    let total = 0;

    cart.forEach(item => {
        const itemElement = `
            <li>
                ${item.name} x ${item.quantity} - $${(item.price * item.quantity).toFixed(2)}
            </li>
        `;
        cartItems.innerHTML += itemElement;
        total += item.price * item.quantity;
    });

    totalElement.innerText = total.toFixed(2);
}

// Handle form submission
document.getElementById('order-form').addEventListener('submit', function(e) {
    e.preventDefault();

    const name = document.getElementById('name').value;
    const phone = document.getElementById('phone').value;
    const email = document.getElementById('email').value;
    const address = document.getElementById('address').value;
    const total = document.getElementById('total').innerHTML;

    if (!name || !phone || !address || cart.length === 0) {
        alert("Please fill in all fields and ensure the cart has items.");
        return;
    }

    const orderData = {
        name,
        phone,
        email,
        address,
        total,
        cart
    };

    // Send the order to the server
    fetch('submit_order.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(orderData)
    })
    .then(() => {
        alert("Order placed successfully!");
        cart = [];
        updateCart();
        document.getElementById('order-form').reset();
    })
    .catch(error => {
        console.error('Error:', error);
    });
});

// Initialize catalog by fetching from the database
fetchCatalog();

// Initialize catalog
// displayCatalog();
