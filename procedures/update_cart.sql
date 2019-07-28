DROP PROCEDURE IF EXISTS bookstore.update_cart;

CREATE PROCEDURE update_cart(
  _user_id integer
  , _book_id integer
  , _qty integer
)
AS $$
BEGIN
  PERFORM *
  FROM bookstore.cart c
  WHERE c.user_id = _user_id
  AND c.book_id = _book_id;

  IF NOT FOUND THEN
    INSERT INTO bookstore.cart(user_id, book_id, qty)
    VALUES(_user_id, _book_id, _qty);
  ELSE
    UPDATE bookstore.cart c
    SET qty = qty + _qty
    WHERE c.user_id = _user_id
    AND c.book_id = _book_id;
  END IF;
END;
$$ LANGUAGE plpgsql;
