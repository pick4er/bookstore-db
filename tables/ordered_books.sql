DROP TABLE IF EXISTS bookstore.ordered_books;
CREATE TABLE bookstore.ordered_books(
  order_id integer REFERENCES orders
  , book_id integer REFERENCES books
  , qty integer NOT NULL
  , PRIMARY KEY (book_id, order_id)
);