USE crazyPizzaGiftDB; /*Name of our database*/

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
    image_path VARCHAR(255),
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
INSERT INTO scp_items (scp_id, scp_classification, description) VALUES ('1096', 'SAFE', 'SCP-1096 is a set of silicone breast implants of various sizes, of which there are currently fifteen (15) pairs in containment. Each instance of SCP-1096 is identified by a lack of serial numbers and the words "The Factory" etched onto the outside surface. Within seven days of being implanted into a suitable female subject, SCP-1096 will slowly begin converting all living tissue within the subject into what appears to be a living silicone-based plastic material. Visible changes begin with the removal of minor blemishes and imperfections and quickly advances into major figure-sculpting transformations, taking approximately ten (10) months to complete. It is currently unknown how this material retains all the properties of living tissue, and how major organs are able to continue functioning despite total conversion to silicone. Affected individuals are often described by observers as being "perfect" and "beautiful", though the exact appearance of each affected subject tends to vary according to that subject''s personal tastes. Complete conversion of the subject''s tissues results in a complete lack of detectable aging in the subject, though the subject also loses the ability to heal naturally; significant injuries inflicted to these subjects result in lasting wounds that do not close. Subjects have reported significant dulling of tactile sensation, including symptoms similar to congenital insensitivity to pain. Conversion of the subject''s brain tissue also results in a slight but progressive reduction in intelligence as well as memory impairment. SCP-1096 was first discovered on █/██/198█ following reports of a woman admitted to a [REDACTED] Hospital following a major car accident [REDACTED] as being "made from plastic" and "bleeding clear blood".');
INSERT INTO scp_items (scp_id, scp_classification, description) VALUES ('1145', 'EUCLID', 'SCP-1145 is a stuffed bear approximately 30 cm tall recovered from Nagasaki, Japan in 19██. Outer fabric consists entirely of leather taken and cured from Ursus thibetanus. The seams are stitched with heavy strands of an unidentified fibrous connective tissue. No attempt has been made to breach the outer covering of the object, as containment protocols do not permit contact with the object long enough to retrieve an inner sample. Aside from a rudimentary snout, SCP-1145 has no facial features. SCP-1145 weighs 9.4 kg, which is considerably heavier than similar stuffed bears of this size; the cause of this discrepancy in weight is unknown.SCP-1145 is radioactive, with doses measured between 2.7 and ████ PBq. In its inactive state, the object emits this radiation consistent with the decay chain of Pu-239 (Pu-239 -> U-235, Alpha decay) and of Pu-241 (Pu-241 -> Am-241, Beta Decay). Unlike samples of Pu-239 and Pu-241, however, the object does not emit any of the gamma radiation normally associated with radioactive decay. The amount of radiation SCP-1145 emits at its base level is 2.7 PBq. This increases at a rate of ████ MBq/s if the object is not illuminated. The presence of water in the enclosure is sufficient to absorb any radiation emitted from the object. Due to the effects of Cherenkov radiation, the water also has a side-effect of providing sufficient illumination to prevent SCP-1145 from transitioning states. When left unilluminated for a period exceeding 3 seconds, the object will enter its active state. When in this state, the object emits gamma radiation. SCP-1145 will begin moving in the direction of the nearest human being. Its method of locomotion is unknown. However, testing has shown the object moves at a speed of approximately 45 meters per second. When in this state, the object is capable of passing through any substance, highly irradiating any surface it passes through, but causing no visible structural damage.Immediately upon coming to rest within 1m of its target, SCP-1145 will begin to increase its emissions at a rate of ████ PBq every 30 seconds. The emissions will continue to increase until the object has been picked up by its target. Once picked up by its target, the emissions will return to base levels as long as the subject maintains unshielded skin contact with it. Upon expiration of its target, SCP-1145 will revert to its inactive state. Should the subject expire while the object is unilluminated, SCP-1145 will immediately resume its active state.');
INSERT INTO scp_items (scp_id, scp_classification, description) VALUES ('1386', 'EUCLID', 'SCP-1386 is a white “Good Humor”-brand ice cream truck, in poor condition and lacking any images or descriptions of the products it sells. The van appears to be sapient, as it drives without a person behind the wheel; after the investigation of 3/15/12, it has been concluded that none of the doors or windows on the vehicle open through conventional means. The van plays instrumental melodies of “Pop Goes the Weasel” and “Twinkle Twinkle Little Star” 24 hours a day, alternating between the two every four hours. On occasion, it has been known to play a version of “Greensleeves,” but will immediately switch to another song when in the presence of customers. SCP-1386 has a thin slot in the middle of its driver-side door, which only becomes visible when it dispenses the various ice cream products it sells. Along with the ice cream, the van slides out a small slip of receipt paper with a price written on it in what has been described as “very sloppy, but legible” handwriting. The van receives payment through the same slot it delivers ice cream from, and will drive away as soon as it is paid. The prices and flavors of the ice cream products it sells fluctuate daily, but it never runs out of its stock of items.');
INSERT INTO scp_items (scp_id, scp_classification, description) VALUES ('1626', 'SAFE-IMPETUS', 'SCP-1626 is a gray size XL hooded sweatshirt made out of polyester. In its inactive state, SCP-1626 is physically unremarkable except that it emits hydrogen sulfide (H2S) gas at levels sufficient to cause it to have a faint but noticeable "rotten egg" scent. Whenever a human wears SCP-1626 for a period of twenty-one minutes or greater, it will extend numerous polyester fibers roughly 1mm in diameter up to 20 centimeters into the subject''s arms and torso. SCP-1626 will not puncture any vital organs or blood vessels, and the fibers secrete potent local anesthetics that almost immediately desensitize the skin at the point of penetration. As such, exposure to SCP-1626 is not immediately lethal, and victims are unlikely to notice its effects unless they attempt to remove SCP-1626. The fibers have shown unusual resilience for their composition, complicating any efforts to remove SCP-1626. Between five and ten minutes after the subject''s skin has been penetrated, the fibers begin to conduct heat away from the subject''s body at an accelerated rate until the subject''s core body temperature is that of the subject''s surroundings. Simultaneously, the fibers will release copious amounts of ethyl alcohol into the subject''s bloodstream, causing extreme inebriation. This appears to have the effect of both decreasing the likelihood that the subject will notice the drop in body temperature and limiting the subject''s ability to seek help. SCP-1626 will increase its production of hydrogen sulfide at this time, giving both it and the wearer a strong, repellent scent. Under normal circumstances, victims of SCP-1626 will die of hypothermia between one and three hours after exposure, depending on the subject''s mass and the temperature of the surroundings. After the subject''s death, the fibers of SCP-1626 will retract and become undetectable. Further, SCP-1626 will cease to release hydrogen sulfide for the next two days unless it is worn during that time.');
    
/*Sample Giftshop Item Insert Statement*/
INSERT INTO giftshop_items (item_id, name, description, price, image_path) VALUES ('8593', 'Pasta with Fazool - Collector''s Edition VHS Tape', 'Enjoy this blast from the past 90''s family Italian cooking show, featuring everyone''s favorite mascot, Fazool Catavelli! Children approved and puts a smile on Grandma''s face!', 22.99, '/images/item_1.jpg');
INSERT INTO giftshop_items (item_id, name, description, price, image_path) VALUES ('1096', 'Inflatable Bouncy Castle', 'Bouncy, bouncy, fun, fun fun!', 54.99, '/images/item_2.jpg');
INSERT INTO giftshop_items (item_id, name, description, price, image_path) VALUES ('1145', 'Cuddles the Brilliant Teddy Bear', 'Need a nice snuggle before catching some Zs? Cuddles has the perfect plush squeeze for you!', 12.99, '/images/item_3.jpg');
INSERT INTO giftshop_items (item_id, name, description, price, image_path) VALUES ('1386', 'Die Cast Pizza Delivery Truck', 'Exclusive! 1/18 Scale Die Cast Model of Steve''s Crazy Pizza Delivery Truck.', 22.99, '/images/item_4.jpg');
INSERT INTO giftshop_items (item_id, name, description, price, image_path) VALUES ('1626', 'Awesome Gray Hoodie - Size XL', 'You are cool as concrete and steel buildings. Build up your ego with this totally rad hoodie!', 14.99, '/images/item_5.jpg');
