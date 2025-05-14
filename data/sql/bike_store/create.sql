-- Tabelas convertidas para SQLite

CREATE TABLE categories (
	category_id INTEGER PRIMARY KEY AUTOINCREMENT,
	category_name TEXT NOT NULL
);

CREATE TABLE brands (
	brand_id INTEGER PRIMARY KEY AUTOINCREMENT,
	brand_name TEXT NOT NULL
);

CREATE TABLE products (
	product_id INTEGER PRIMARY KEY AUTOINCREMENT,
	product_name TEXT NOT NULL,
	brand_id INTEGER NOT NULL,
	category_id INTEGER NOT NULL,
	model_year INTEGER NOT NULL,
	list_price REAL NOT NULL,
	FOREIGN KEY (category_id) REFERENCES categories (category_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (brand_id) REFERENCES brands (brand_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE customers (
	customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	phone TEXT,
	email TEXT NOT NULL,
	street TEXT,
	city TEXT,
	state TEXT,
	zip_code TEXT
);

CREATE TABLE stores (
	store_id INTEGER PRIMARY KEY AUTOINCREMENT,
	store_name TEXT NOT NULL,
	phone TEXT,
	email TEXT,
	street TEXT,
	city TEXT,
	state TEXT,
	zip_code TEXT
);

CREATE TABLE staffs (
	staff_id INTEGER PRIMARY KEY AUTOINCREMENT,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	email TEXT NOT NULL UNIQUE,
	phone TEXT,
	active INTEGER NOT NULL,
	store_id INTEGER NOT NULL,
	manager_id INTEGER,
	FOREIGN KEY (store_id) REFERENCES stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES staffs (staff_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE orders (
	order_id INTEGER PRIMARY KEY AUTOINCREMENT,
	customer_id INTEGER,
	order_status INTEGER NOT NULL, -- 1=Pending, 2=Processing, 3=Rejected, 4=Completed
	order_date TEXT NOT NULL,
	required_date TEXT NOT NULL,
	shipped_date TEXT,
	store_id INTEGER NOT NULL,
	staff_id INTEGER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (store_id) REFERENCES stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (staff_id) REFERENCES staffs (staff_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE order_items (
	order_id INTEGER,
	item_id INTEGER,
	product_id INTEGER NOT NULL,
	quantity INTEGER NOT NULL,
	list_price REAL NOT NULL,
	discount REAL NOT NULL DEFAULT 0,
	PRIMARY KEY (order_id, item_id),
	FOREIGN KEY (order_id) REFERENCES orders (order_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE stocks (
	store_id INTEGER,
	product_id INTEGER,
	quantity INTEGER,
	PRIMARY KEY (store_id, product_id),
	FOREIGN KEY (store_id) REFERENCES stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE CASCADE ON UPDATE CASCADE
);
