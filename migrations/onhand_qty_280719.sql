ALTER TABLE bookstore.books ADD COLUMN onhand_qty integer;

BEGIN;

LOCK TABLE bookstore.operations;

UPDATE bookstore.books b
SET onhand_qty = (
  SELECT coalesce(sum(o.qty_change),0)
  FROM bookstore.operations o
  WHERE o.book_id = b.book_id
);

ALTER TABLE bookstore.books ALTER COLUMN onhand_qty SET DEFAULT 0;
ALTER TABLE bookstore.books ALTER COLUMN onhand_qty SET NOT NULL;
ALTER TABLE bookstore.books ADD CHECK(onhand_qty >= 0);

CREATE TRIGGER update_onhand_qty_trigger
BEFORE INSERT ON bookstore.operations
FOR EACH ROW
EXECUTE PROCEDURE bookstore.update_onhand_qty();

COMMIT;
