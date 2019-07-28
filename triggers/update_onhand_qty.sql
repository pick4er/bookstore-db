DROP FUNCTION IF EXISTS bookstore.update_onhand_qty;
CREATE OR REPLACE FUNCTION update_onhand_qty()
RETURNS trigger
AS $$
BEGIN
  UPDATE bookstore.books b
  SET onhand_qty = b.onhand_qty + NEW.qty_change
  WHERE b.book_id = NEW.book_id;
  RETURN NEW;
END;
$$ VOLATILE LANGUAGE plpgsql;
