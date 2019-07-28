DROP PROCEDURE IF EXISTS bookstore.clear_user_cart;

CREATE PROCEDURE clear_user_cart(_user_id integer)
AS $$
  DELETE FROM bookstore.cart c
  WHERE c.user_id = _user_id;
$$ LANGUAGE SQL;