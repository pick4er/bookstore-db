DROP FUNCTION IF EXISTS create_order;
CREATE FUNCTION create_order(_user_id integer)
RETURNS integer
AS $$
DECLARE
  _order_id integer;
BEGIN
  INSERT INTO bookstore.orders (user_id)
  VALUES (_user_id)
  RETURNING order_id INTO _order_id;

  WITH books_from_cart AS (
    DELETE FROM bookstore.cart c
    WHERE c.user_id = _user_id
    RETURNING book_id, qty
  )
  INSERT INTO bookstore.ordered_books
    SELECT 
      _order_id AS order_id, 
      book_id, 
      qty
    FROM books_from_cart;

  RETURN _order_id;
END;
$$ VOLATILE LANGUAGE plpgsql;
