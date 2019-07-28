DROP PROCEDURE IF EXISTS bookstore.remove_from_cart;

CREATE PROCEDURE remove_from_cart(
  _user_id integer, 
  _book_id integer
)
AS $$
  DELETE FROM bookstore.cart c
  WHERE c.user_id = _user_id
  AND c.book_id = _book_id;
$$ LANGUAGE SQL;
