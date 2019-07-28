ALTER TABLE bookstore.books ADD COLUMN price integer;

BEGIN;

LOCK TABLE bookstore.books;
UPDATE bookstore.books
SET price = 123;

ALTER TABLE bookstore.books ALTER COLUMN price SET DEFAULT 0;
ALTER TABLE bookstore.books ALTER COLUMN price SET NOT NULL;
ALTER TABLE bookstore.books ADD CHECK(price >= 0);

COMMIT;
