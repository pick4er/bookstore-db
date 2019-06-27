CREATE TABLE bookstore.operations(
  operation_id serial PRIMARY KEY,
  book_id integer NOT NULL REFERENCES books,
  qty_change integer,
  date_created date DEFAULT current_date
);

INSERT INTO operations(operation_id, book_id, qty_change) VALUES(1, 1, 10);
INSERT INTO operations(operation_id, book_id, qty_change) VALUES(2, 1, 10);
INSERT INTO operations(operation_id, book_id, qty_change) VALUES(3, 1, -1);
