DROP VIEW IF EXISTS catalog_v;
CREATE OR REPLACE VIEW catalog_v AS
SELECT
  b.book_id,
  b.title,
  b.onhand_qty,
  b.price,
  bookstore.book_authors(b.book_id) AS authors,
  bookstore.book_name(b.book_id, b.title) AS display_name
FROM bookstore.books b
ORDER BY display_name;