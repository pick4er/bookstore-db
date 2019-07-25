DROP TABLE IF EXISTS bookstore.billings CASCADE;
CREATE TABLE bookstore.billings(
  billing_id serial PRIMARY KEY,
  user_id integer REFERENCES users,
  first_name text,
  last_name text,
  middle_name text,
  phone text,
  shipping_address text
);
