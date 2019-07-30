DROP VIEW IF EXISTS catalog_v;
CREATE OR REPLACE VIEW catalog_v AS
SELECT
  b.book_id,
  b.title,
  b.onhand_qty,
  b.price,
  bookstore.book_authors(b.book_id) AS authors,
  (
    SELECT array_agg(a.author_id ORDER BY a.author_id) authors_ids
    FROM bookstore.authors a
    JOIN bookstore.authorship ash ON a.author_id = ash.author_id
    WHERE ash.book_id = b.book_id
  ),
  bookstore.book_name(b.book_id, b.title) AS display_name
FROM bookstore.books b
ORDER BY display_name;