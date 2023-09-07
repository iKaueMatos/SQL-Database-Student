USE fruitjuice;

/*
Product Table
*/
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    descriptor VARCHAR(100),
    flavor VARCHAR(50),
    size VARCHAR(50),
    packing VARCHAR(50),
    price_list DECIMAL(10, 2)
);

/*
Sellers Table
*/
CREATE TABLE sellers (
    seller_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    neighborhood VARCHAR(50) NOT NULL,
    Committee FLOAT,
    date_issue DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    holiday BOOLEAN
);

/*
Table Client
*/
CREATE TABLE clients (
    cpf VARCHAR(11) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    neighborhood VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    date_of_birth DATE,
    age TINYINT,
    sex ENUM('M', 'F', 'Other'),
    limit_credit DECIMAL(10, 2),
    purchase_volume DECIMAL(10, 2),
    first_purchase BOOLEAN
);

/*
Sales Table
*/
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    data_sale DATETIME,
    cpf VARCHAR(11) NOT NULL,
    seller_id INT NOT NULL,
    tax DECIMAL(10, 2),
    FOREIGN KEY (cpf) REFERENCES clients(cpf),
    FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
);

/*
Items_invoices Table
*/
CREATE TABLE items_invoices (
    sale_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT,
    price DECIMAL(10, 2),
    PRIMARY KEY (sale_id, product_id),
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

/*history sales Table*/
CREATE TABLE history_sales (
	request_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	cpf VARCHAR(11),
	sale_id INT,
	FOREIGN KEY (cpf) REFERENCES clients(cpf), 
	FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
);
