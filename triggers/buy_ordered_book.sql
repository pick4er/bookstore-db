DROP FUNCTION IF EXISTS buy_ordered_book;
CREATE FUNCTION buy_ordered_book()
RETURNS trigger
AS $$
DECLARE
  book_id integer;
  qty integer;
BEGIN
  book_id := NEW.book_id;
  qty := NEW.qty;

  CALL bookstore.buy_book(book_id, qty);

  RETURN NEW;
END;
$$ VOLATILE LANGUAGE plpgsql;

CREATE TRIGGER buy_ordered_book_trigger
BEFORE INSERT ON bookstore.ordered_books
FOR EACH ROW
EXECUTE PROCEDURE bookstore.buy_ordered_book();
