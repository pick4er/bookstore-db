DROP PROCEDURE IF EXISTS keep_book;
CREATE PROCEDURE keep_book(book_id integer, qty integer)
AS $$
  INSERT INTO bookstore.operations(book_id, qty_change)
    VALUES (book_id, qty);
$$ LANGUAGE SQL;
