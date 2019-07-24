CREATE TABLE bookstore.permissions(
  user_id integer REFERENCES users,
  mode_id integer REFERENCES user_modes,
  PRIMARY KEY (user_id, mode_id)
);