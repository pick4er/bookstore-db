DROP VIEW IF EXISTS bookstore.cart_v;

CREATE OR REPLACE VIEW cart_v AS
SELECT
  c.user_id,
  c.book_id,
  c.qty AS order_qty,
  v.title,
  v.price,
  v.onhand_qty,
  v.authors,
  v.display_name
FROM bookstore.cart c
JOIN bookstore.catalog_v v ON v.book_id = c.book_id
