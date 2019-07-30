DROP PROCEDURE IF EXISTS bookstore.update_book;
CREATE PROCEDURE update_book(
  _book_id integer
  , _title text
  , authors integer[]
  , _price integer
  , _qty integer
)
AS $$
DECLARE
  id integer;
  seq_num integer;
  qty_change integer;
  current_qty integer;
BEGIN
  --- Update authorship
  DELETE FROM bookstore.authorship a
  WHERE a.book_id = _book_id;
  FOREACH id IN ARRAY authors LOOP
    INSERT INTO bookstore.authorship(book_id, author_id, seq_num)
      VALUES (_book_id, id, seq_num);
    seq_num := seq_num + 1;
  END LOOP;

  --- Update direct columns
  UPDATE bookstore.books b
  SET (title, price) = (_title, _price)
  WHERE b.book_id = _book_id;

  --- Force update quantity
  SELECT onhand_qty INTO current_qty
  FROM bookstore.books b
  WHERE b.book_id = _book_id;
  IF _qty IS NOT NULL AND _qty <> current_qty THEN    
    qty_change := _qty - current_qty;
    CALL bookstore.keep_book(_book_id, qty_change);
  END IF;
END;
$$ LANGUAGE plpgsql;
