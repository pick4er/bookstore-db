CREATE TABLE bookstore.users(
  user_id serial PRIMARY KEY,
  login text UNIQUE NULL,
  email text NOT NULL UNIQUE,
  password_hash text NOT NULL,
  salt text NOT NULL
);
