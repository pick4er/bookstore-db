CREATE TABLE bookstore.user_modes(
  mode_name text PRIMARY KEY,
  can_change_books boolean DEFAULT FALSE,
  can_change_authors boolean DEFAULT FALSE
);