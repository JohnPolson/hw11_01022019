-- psql -d cinema -f cinema.sql

DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE customers
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  funds INT4
);

CREATE TABLE films
(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  price INT2
);

CREATE TABLE tickets
(
  id SERIAL8 PRIMARY KEY,
  customer_id INT8 REFERENCES customers(id),
  film_id INT8 REFERENCES films(id)
);

INSERT INTO customers (name, funds) VALUES ('Matt', 50);
INSERT INTO customers (name, funds) VALUES ('Neil', 65);
INSERT INTO customers (name, funds) VALUES ('Linda', 85);
INSERT INTO customers (name, funds) VALUES ('Jane', 55);
INSERT INTO customers (name, funds) VALUES ('Karen', 45);

INSERT INTO films (title, price) VALUES ('Aliens', 5);
INSERT INTO films (title, price) VALUES ('Serenity', 7);
INSERT INTO films (title, price) VALUES ('Oblivion', 5);
INSERT INTO films (title, price) VALUES ('Lucy', 7);
INSERT INTO films (title, price) VALUES ('Interstellar', 5);
INSERT INTO films (title, price) VALUES ('Arrival', 7);

INSERT INTO tickets (customer_id, film_id) VALUES (1, 1);
INSERT INTO tickets (customer_id, film_id) VALUES (2, 3);
INSERT INTO tickets (customer_id, film_id) VALUES (3, 5);
INSERT INTO tickets (customer_id, film_id) VALUES (4, 2);
INSERT INTO tickets (customer_id, film_id) VALUES (5, 4);
INSERT INTO tickets (customer_id, film_id) VALUES (1, 6);
INSERT INTO tickets (customer_id, film_id) VALUES (2, 1);
INSERT INTO tickets (customer_id, film_id) VALUES (3, 3);
INSERT INTO tickets (customer_id, film_id) VALUES (4, 5);
INSERT INTO tickets (customer_id, film_id) VALUES (5, 2);
