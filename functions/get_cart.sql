DROP FUNCTION IF EXISTS bookstore.get_cart;

CREATE FUNCTION get_cart(_user_id integer)
RETURNS TABLE(book_id integer, qty integer)
AS $$
  SELECT
    book_id,
    qty
  FROM bookstore.cart c
  WHERE c.user_id = _user_id;
$$ LANGUAGE SQL;
