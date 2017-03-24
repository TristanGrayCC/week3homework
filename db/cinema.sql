DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE customers (
  id SERIAL4 primary key,
  name VARCHAR(255),
  funds INT2
);

CREATE TABLE films (
  id SERIAL4 primary key,
  title VARCHAR(255),
  price INT2
);

CREATE TABLE tickets (
  id SERIAL4 primary key,
  customer_id INT4 REFERENCES customers(id),
  film_id INT4 REFERENCES films(id)
);
