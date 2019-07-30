DROP FUNCTION IF EXISTS bookstore.get_cart;

CREATE FUNCTION get_cart(_user_id integer)
RETURNS TABLE(LIKE bookstore.cart_v)
AS $$
  SELECT * FROM bookstore.cart_v c
  WHERE c.user_id = _user_id;
$$ LANGUAGE SQL;
