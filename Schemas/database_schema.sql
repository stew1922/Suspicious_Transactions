DROP TABLE IF EXISTS card_holder CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS merchant_category CASCADE; 
DROP TABLE IF EXISTS merchant CASCADE;
DROP TABLE IF EXISTS transactions CASCADE; 

CREATE TABLE card_holder (
	card_holder_id INT PRIMARY KEY
	, card_holder VARCHAR(50)
);

CREATE TABLE credit_card (
	card VARCHAR(50) PRIMARY KEY
	, id_card_holder INT
	, FOREIGN KEY (id_card_holder) REFERENCES card_holder(card_holder_id)
);

CREATE TABLE merchant_category (
	id_merchant_category INT PRIMARY KEY
	, merchant_category VARCHAR(30)
);

CREATE TABLE merchant (
	id_merchant INT PRIMARY KEY
	, merchant_name VARCHAR(50)
	, id_merchant_cartegory INT
	, FOREIGN KEY (id_merchant_cartegory) REFERENCES merchant_category(id_merchant_category)
);

CREATE TABLE transactions (
	transaction_id INT PRIMARY KEY
	, trans_date TIMESTAMP 
	, amount FLOAT
	, card VARCHAR(50)
	, FOREIGN KEY (card) REFERENCES credit_card(card)
	, id_merchant INT
	, FOREIGN KEY (id_merchant) REFERENCES merchant(id_merchant)
);