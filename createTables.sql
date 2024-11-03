USE testdb;

/*When orders are filled, information from this table are emailed as an encrypted invoice. In other words, this table represents the true order items.*/
CREATE TABLE scp_items (
    scp_id SMALLINT PRIMARY KEY, /*SCP IDs go up to around 10,000 so no need for higher values*/
    scp_classification VARCHAR(30),
    description VARCHAR(5000)
);

/*Presents the items that can be ordered from the giftshop*/
CREATE TABLE giftshop_items (
    item_id SMALLINT PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(5000),
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (item_id) REFERENCES scp_items(scp_id)
);

/*Order table holds customer's info along with the total of the invoice.*/
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    address VARCHAR(200) NOT NULL,
    email VARCHAR(100) NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*Represents the order items in giftshop shopping cart.*/
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    item_id SMALLINT,
    quantity INT NOT NULL,
    FOREIGN KEY (item_id) REFERENCES giftshop_items(item_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);



/*Sample SCP Item Insert Statement (Source: https://scp-wiki.wikidot.com/scp-8593)*/
INSERT INTO scp_items (scp_id, scp_classification, description) VALUES ('8593', 'EUCLID', 'SCP-8593 is a series of television broadcasts for "Pasta with Fazool," a cooking show focused on Italian American cuisine. SCP-8593-1 hosts SCP-8593 and is a victual humanoid entity self-identifying as "Fazool Cavatelli." SCP-8593-1''s body is composed entirely of dry pasta; its torso is constructed from a bundle of spaghetti, while two pieces of penne form its arms. SCP-8593-1 possesses human hands, which are incongruent with the rest of its composition and each other. Its head is a large meatball, capable of limited facial expressions and speech in English. SCP-8593-1''s outfit changes between episodes, though these changes appear limited to commonly colored or patterned aprons and matching toques. SCP-8593-1 appears on SCP-8593 as a poorly keyframe-animated puppet, a characteristic never acknowledged by it or any guests who treat it as a baseline human while also recognizing that it''s composed entirely of food. It moves with jerky, unnatural movements, with parts of its body often disconnecting from each other. SCP-8593-1''s hands constantly change size, shape, and skin color to accommodate different gestures or movements. Despite this, SCP-8593 can interact with physical objects, including human guests and various cooking utensils. Lighting does not affect SCP-8593-1, giving it a flat, two-dimensional appearance at all times. Despite SCP-8593-1 claiming SCP-8593 is focused on Italian American cuisine, all presented materials, including recipes, origins of said recipes, and Italian history differ significantly from any traditions known on Earth. No source for SCP-8593 broadcasts has been discovered.');
INSERT INTO scp_items (scp_id, scp_classification, description) VALUES ('1', 'EUCLID', 'SCP-8593 is a series of television broadcasts for "Pasta with Fazool," a cooking show focused on Italian American cuisine. SCP-8593-1 hosts SCP-8593 and is a victual humanoid entity self-identifying as "Fazool Cavatelli." SCP-8593-1''s body is composed entirely of dry pasta; its torso is constructed from a bundle of spaghetti, while two pieces of penne form its arms. SCP-8593-1 possesses human hands, which are incongruent with the rest of its composition and each other. Its head is a large meatball, capable of limited facial expressions and speech in English. SCP-8593-1''s outfit changes between episodes, though these changes appear limited to commonly colored or patterned aprons and matching toques. SCP-8593-1 appears on SCP-8593 as a poorly keyframe-animated puppet, a characteristic never acknowledged by it or any guests who treat it as a baseline human while also recognizing that it''s composed entirely of food. It moves with jerky, unnatural movements, with parts of its body often disconnecting from each other. SCP-8593-1''s hands constantly change size, shape, and skin color to accommodate different gestures or movements. Despite this, SCP-8593 can interact with physical objects, including human guests and various cooking utensils. Lighting does not affect SCP-8593-1, giving it a flat, two-dimensional appearance at all times. Despite SCP-8593-1 claiming SCP-8593 is focused on Italian American cuisine, all presented materials, including recipes, origins of said recipes, and Italian history differ significantly from any traditions known on Earth. No source for SCP-8593 broadcasts has been discovered.');
INSERT INTO scp_items (scp_id, scp_classification, description) VALUES ('2', 'EUCLID', 'SCP-8593 is a series of television broadcasts for "Pasta with Fazool," a cooking show focused on Italian American cuisine. SCP-8593-1 hosts SCP-8593 and is a victual humanoid entity self-identifying as "Fazool Cavatelli." SCP-8593-1''s body is composed entirely of dry pasta; its torso is constructed from a bundle of spaghetti, while two pieces of penne form its arms. SCP-8593-1 possesses human hands, which are incongruent with the rest of its composition and each other. Its head is a large meatball, capable of limited facial expressions and speech in English. SCP-8593-1''s outfit changes between episodes, though these changes appear limited to commonly colored or patterned aprons and matching toques. SCP-8593-1 appears on SCP-8593 as a poorly keyframe-animated puppet, a characteristic never acknowledged by it or any guests who treat it as a baseline human while also recognizing that it''s composed entirely of food. It moves with jerky, unnatural movements, with parts of its body often disconnecting from each other. SCP-8593-1''s hands constantly change size, shape, and skin color to accommodate different gestures or movements. Despite this, SCP-8593 can interact with physical objects, including human guests and various cooking utensils. Lighting does not affect SCP-8593-1, giving it a flat, two-dimensional appearance at all times. Despite SCP-8593-1 claiming SCP-8593 is focused on Italian American cuisine, all presented materials, including recipes, origins of said recipes, and Italian history differ significantly from any traditions known on Earth. No source for SCP-8593 broadcasts has been discovered.');
INSERT INTO scp_items (scp_id, scp_classification, description) VALUES ('3', 'EUCLID', 'SCP-8593 is a series of television broadcasts for "Pasta with Fazool," a cooking show focused on Italian American cuisine. SCP-8593-1 hosts SCP-8593 and is a victual humanoid entity self-identifying as "Fazool Cavatelli." SCP-8593-1''s body is composed entirely of dry pasta; its torso is constructed from a bundle of spaghetti, while two pieces of penne form its arms. SCP-8593-1 possesses human hands, which are incongruent with the rest of its composition and each other. Its head is a large meatball, capable of limited facial expressions and speech in English. SCP-8593-1''s outfit changes between episodes, though these changes appear limited to commonly colored or patterned aprons and matching toques. SCP-8593-1 appears on SCP-8593 as a poorly keyframe-animated puppet, a characteristic never acknowledged by it or any guests who treat it as a baseline human while also recognizing that it''s composed entirely of food. It moves with jerky, unnatural movements, with parts of its body often disconnecting from each other. SCP-8593-1''s hands constantly change size, shape, and skin color to accommodate different gestures or movements. Despite this, SCP-8593 can interact with physical objects, including human guests and various cooking utensils. Lighting does not affect SCP-8593-1, giving it a flat, two-dimensional appearance at all times. Despite SCP-8593-1 claiming SCP-8593 is focused on Italian American cuisine, all presented materials, including recipes, origins of said recipes, and Italian history differ significantly from any traditions known on Earth. No source for SCP-8593 broadcasts has been discovered.');

/*Sample Giftshop Item Insert Statement*/
INSERT INTO giftshop_items (item_id, description, price) VALUES ('8593', 'Pasta with Fazool - Collector''s Edition VHS Tape, Enjoy this blast from the past 90''s family Italian cooking show, featuring everyone''s favorite mascot, Fazool Catavelli! Children approved and puts a smile on Grandma''s face!', 22.99);
INSERT INTO giftshop_items (item_id, description, price) VALUES ('1', 'Pasta with Fazool - Collector''s Edition VHS Tape, Enjoy this blast from the past 90''s family Italian cooking show, featuring everyone''s favorite mascot, Fazool Catavelli! Children approved and puts a smile on Grandma''s face!', 22.99);
INSERT INTO giftshop_items (item_id, description, price) VALUES ('2', 'Pasta with Fazool - Collector''s Edition VHS Tape, Enjoy this blast from the past 90''s family Italian cooking show, featuring everyone''s favorite mascot, Fazool Catavelli! Children approved and puts a smile on Grandma''s face!', 22.99);
INSERT INTO giftshop_items (item_id, description, price) VALUES ('3', 'Pasta with Fazool - Collector''s Edition VHS Tape, Enjoy this blast from the past 90''s family Italian cooking show, featuring everyone''s favorite mascot, Fazool Catavelli! Children approved and puts a smile on Grandma''s face!', 22.99);
