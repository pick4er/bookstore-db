DROP TABLE IF EXISTS bookstore.orders;
CREATE TABLE bookstore.orders(
  order_id serial PRIMARY KEY
  , user_id integer REFERENCES users
  , date_created date DEFAULT current_date
  , status text
);
