DROP TABLE IF EXISTS bookstore.cart;
CREATE TABLE bookstore.cart(
  user_id integer REFERENCES bookstore.users
  , book_id integer REFERENCES bookstore.books
  , qty integer NOT NULL
  , PRIMARY KEY (user_id,book_id)
);
